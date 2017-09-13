#!/bin/bash

# This awk command takes the csv file, breaks down the first name and surname of the candidate
# and makes it of the form lastnameFirstnameFather'snameYearofjoining and adds the branch in the end
echo -e "This is the first awk command\n"
awk '\
BEGIN \
{ FS="," } \
{ $7 = substr($1, 0 ,1) } \
{ $7 = tolower($7) } \
{ $8 = substr($2, 0 ,1) } \
{ $8 = tolower($8) } \
{ $9 = tolower($3) } \
{ $10 = tolower($4) } \
{ $5 = substr($5, 3 ,3) } \
{ $6 = $9$7$8$5"."$10 } \
{ print $6 } \
END {} \' $1 > output.csv
# cat output.csv

# This command handles the duplicates and adds the number after the YearofJoining field and makes the email unique
# To change the delimiter UNDERSCORE to HYPHEN change it accordingly in only the printf statement of the else block below
echo -e "This is the second awk command\n"
# awk '{ split($1, a, ".", seps); printf("%s", a[1]); if(count[$1] == 0) printf("%s.%s@coep.ac.in\n", count[$1], a[2]); else printf("_%s.%s@coep.ac.in\n", count[$1], a[2]); count[$1]++ }' output.csv > finalone.csv
awk '{ split($1, a, ".", seps) } \
{ printf("%s", a[1]) } \
{ if(count[$1] == 0) printf("%s.%s@coep.ac.in\n", count[$1], a[2]); else printf("_%s.%s@coep.ac.in\n", count[$1], a[2]) } \
{ count[$1]++ }' output.csv > finalone.csv


# Puts the generated emails in the final.csv file
paste -d"," data.csv finalone.csv > final.csv
# cat finalone.csv

# removes the intermediate files generated
rm output.csv
rm finalone.csv
