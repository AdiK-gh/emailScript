This is the Readme file for how to run the script genEmail.sh

Files required :
    input csv file: File with the names of the students along with their branch and year of joining
        example : "Chandler,Muriel,Bing,IT,2016" should the be the type of a typical row present in the file
        the branch names should be in their short forms beforehand the script is run
        Metallurgy should be mentioned as meta, computer as comp, information technology as it irrespective of being uppercase or lowercase

Command to run the script : "bash genEmail.sh <filename.csv>"

The emails are generated of the form :
    For the entry Chandler,Muriel,Bing,IT,2014 the email generated would be -> "bingcm16.it@coep.ac.in"
    For an entry that clashes with the above one the new email would look like -> "bingcm16_1.it@coep.ac.in", "bingcm16_2.it@coep.ac.in"

    ie a count integer is added after the year field in the email ID and before the branch field
    the count number is given according to the order of appearance of the name

    these are appended to the input file line by line and a final.csv file is formed of the format
    "Chandler,Muriel,Bing,IT,2016,bingcm16.it@coep.ac.in"
    "C,M,Bing,IT,2016,bingcm16_1.it@coep.ac.in"

There are 2 intermediate files formed, but they are removed at the end of the execution of the script
