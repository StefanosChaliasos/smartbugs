#!/bin/bash

# Run .github/github_results.sh from SmartBugs home directory
# Generates .github/results-ubuntu.csv, needed for the workflow ubuntu.yml
# as a reference for comparing the results of the workflow with

rm -rf results/github
./smartbugs -t all -f 'samples/simple_dao.*' --runid github --json
./results2csv -x start duration -- results/*/github \
    | sed 's/,Transaction_Order_Dependency//' \
    > .github/results-ubuntu.csv
