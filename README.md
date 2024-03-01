# Linux 
This repository will be containing exercises and my journey with learning Bash and linux terminal
## questions and solutions
1. Create a project directory called Exercise. Which commands did you use?
```
mkdir exercise
```

2. In the directory, create all the sub-directories you would need for a Bioinformatics
Project
```
mkdir -p data scripts results
cd data
mkdir -p Raw Processed
```
3. With the provided dataset files, put them in the appropriate directories you created
under your Bioinformatics Project
```
cp exercise .
cp *.fa ./Raw
```
4. Extract the sequence headers and save into a file `sequence_names.txt` in the
appropriate directory
```
cat *.fa >> joined.fa
grep "^>" joined.fa > sequence_names.txt 
mv sequence_name.txt ../Processed
```
5. Save the commands you used in question 4 in a script file `extract_seq.sh`

```
vim extract_seq.sh
```
6. Count the number of mRNA.

```
grep -i "mRNA" joined.fa
```
- What other sequences apart from mRNA?
```
grep "^>" joined.fa | grep -v "mRNA"
```
- For each category, how many are there?
```
grep -c "cDNA" joined.fa
grep -c "complete sequence" joined.fa
grep -c "transgenic" joined.fa
grep -c "^>" joined.fa | grep -v "mRNA" | grep -v "cDNA" |grep -v "transgenic" |grep -v "complete sequence"
```
- Save the above output to files.
```
grep "cDNA" joined.fa > cDNA.txt
grep "mRNA" joined.fa > mRNA.txt
grep "transgenic" joined.fa > transgenic.txt
grep "complete sequence" joined.fa > complete_sequence.txt
```
7. How many organisms (create a file with the organisms without duplicates)
```
grep "PREDICTED" joined.fa | cut -d' ' -f3,4 | uniq -d > organism.txt
```
8. How many are predicted?
```
grep -c "PREDICTED"  joined.fa
```
9. How many nucleotides are in the file? How many of each of the bases are there?
```
grep -v '^>' sequences.fasta | tr -d '\n' | grep -o '[ACGTU]' | sort | uniq -c
```
