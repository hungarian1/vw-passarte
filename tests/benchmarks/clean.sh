#!/bin/bash
read -r -p "Are you sure? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    rm -rf results
    echo "Results folder cleaned."
fi
