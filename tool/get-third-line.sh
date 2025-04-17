#!/bin/bash -xe

rm -f data/projects.txt

for i in data/*; do
  awk 'NR %3 == 1' $i | tee -a data/projects.txt
done
