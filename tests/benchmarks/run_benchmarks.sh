#!/bin/bash
# ============================================================
# galeria_arte — mariadb-slap benchmark suite
# Usage: bash run_benchmarks.sh or ./run_benchmarks
# Requires: mariadb-slap (ships with MariaDB)
# ============================================================

DB="galeria_arte"
USER="root"
HOST="127.0.0.1"
RESULTS_DIR="./results"
mkdir -p "$RESULTS_DIR"

echo "Enter MySQL password:"
read -s PASS

BASE="mariadb-slap -u $USER -p$PASS -h $HOST --create-schema=$DB"

# ============================================================
# TEST 1 — Simple SELECT (baseline read speed)
# Simulates visitors browsing the exhibition list
# ============================================================
echo ""
echo ">>> TEST 1: Simple SELECT — exposicoes list"
$BASE \
  --query="SELECT idExposicao, nome, tema, data_inicio, data_fim FROM Exposicao;" \
  --concurrency=10,25,50 \
  --iterations=20 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test1_simple_select.csv" \
  --verbose

# ============================================================
# TEST 2 — Filtered query with WHERE (index test on estado)
# Simulates fetching all used tickets
# ============================================================
echo ""
echo ">>> TEST 2: Filtered SELECT — inscricoes by estado"
$BASE \
  --query="SELECT idInscricao, data_visita, valor_pago FROM Inscricao WHERE estado = 'USADA';" \
  --concurrency=10,25,50 \
  --iterations=20 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test2_filtered_select.csv" \
  --verbose

# ============================================================
# TEST 3 — Date range scan (tests full table scan vs index)
# Run EXPLAIN ANALYZE on this query to check if index needed
# ============================================================
echo ""
echo ">>> TEST 3: Date range scan — inscricoes in 2025"
$BASE \
  --query="SELECT * FROM Inscricao WHERE data_visita BETWEEN '2025-01-01' AND '2025-12-31';" \
  --concurrency=10,25,50 \
  --iterations=15 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test3_date_range.csv" \
  --verbose

# ============================================================
# TEST 4 — JOIN query (FK index chain test)
# Simulates a report: visitor name + their inscricoes
# ============================================================
echo ""
echo ">>> TEST 4: JOIN — visitante + inscricao + exposicao"
$BASE \
  --query="SELECT v.nome, e.nome AS exposicao, i.data_visita, i.valor_pago, i.estado
           FROM Visitante v
           JOIN Inscricao i  ON i.idVisitante = v.idVisitante
           JOIN Exposicao e  ON e.idExposicao  = i.idExposicao
           LIMIT 100;" \
  --concurrency=10,25,50 \
  --iterations=15 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test4_join.csv" \
  --verbose

# ============================================================
# TEST 5 — Aggregation (GROUP BY stress test)
# Simulates revenue report per exposicao
# ============================================================
echo ""
echo ">>> TEST 5: Aggregation — revenue per exposicao"
$BASE \
  --query="SELECT e.nome, COUNT(i.idInscricao) AS total_inscricoes, SUM(i.valor_pago) AS receita
           FROM Exposicao e
           LEFT JOIN Inscricao i ON i.idExposicao = e.idExposicao
           GROUP BY e.idExposicao
           ORDER BY receita DESC;" \
  --concurrency=10,25,50 \
  --iterations=15 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test5_aggregation.csv" \
  --verbose

# ============================================================
# TEST 6 — Heavy JOIN across 4 tables (worst-case query)
# Simulates an artist report with works, movements, expositions
# ============================================================
echo ""
echo ">>> TEST 6: Heavy JOIN — artista + obra + movimento + exposicao"
$BASE \
  --query="SELECT a.nome AS artista, o.tema, ma.nome AS movimento, e.nome AS exposicao
           FROM Artista a
           JOIN Obra_Artista oa  ON oa.idArtista   = a.idArtista
           JOIN Obra o           ON o.idObra        = oa.idObra
           JOIN Movimento_Artistico ma ON ma.idMovimento = o.idMovimento
           JOIN Exposicao_Obra eo ON eo.idObra      = o.idObra
           JOIN Exposicao e      ON e.idExposicao   = eo.idExposicao;" \
  --concurrency=5,10,25 \
  --iterations=10 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test6_heavy_join.csv" \
  --verbose

# ============================================================
# TEST 7 — Mixed read/write (concurrent insert + select)
# Simulates real-time ticket purchases
# ============================================================
echo ""
echo ">>> TEST 7: Mixed workload — INSERT inscricao + SELECT"
$BASE \
  --query="INSERT INTO Inscricao (data_visita, valor_pago, estado, idVisitante, idExposicao)
           SELECT CURDATE(), ROUND(RAND()*15,2), 'PENDENTE',
             (SELECT idVisitante FROM Visitante ORDER BY RAND() LIMIT 1),
             (SELECT idExposicao FROM Exposicao ORDER BY RAND() LIMIT 1);
           SELECT COUNT(*) FROM Inscricao WHERE estado = 'PENDENTE';" \
  --concurrency=5,10,25 \
  --iterations=10 \
  --delimiter=";" \
  --csv="$RESULTS_DIR/test7_mixed.csv" \
  --verbose

echo ""
echo "============================================================"
echo "All benchmarks complete. Results saved to: $RESULTS_DIR/"
echo "============================================================"
