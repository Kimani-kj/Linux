#!/usr/bin/bash
cat *.fa >> joined.fa
grep "^>" joined.fa >> sequence_name.txt
mv sequence_name.txt ../Processed
