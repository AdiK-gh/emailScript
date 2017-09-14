#!/usr/bin/python
import csv
from collections import Counter

def rename_duplicates(old):
    seen = {}
    for x in old:
        if x in seen:
            seen[x] += 1
            yield "%s_%d" % (x, seen[x])
        else:
            seen[x] = 0
            yield x

fin = []
inputFile = raw_input("Please enter the input file name : ")

with open(inputFile, "rb") as csvfile:
    reader = list(csv.reader(csvfile, delimiter=','))

    for row in reader:
        fin.append(row[2].lower() + row[0][0].lower() + row[1][0].lower() + row[4][2:] + "." + row[3].lower())

    finale = list(rename_duplicates(fin))

for i in range(len(reader)):
    reader[i].append(finale[i])

for temp in reader:
    temp[5] = temp[5] + "@coep.ac.in"

with open("output.csv", "wb") as f:
    writer = csv.writer(f)
    writer.writerows(reader)
