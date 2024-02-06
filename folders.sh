# demo_ls folder
    cd demo_ls

# 4.1 - What is the oldest file?
    ls -lt | tail -n 1

# 4.2 - What is the newest file?
    ls -lt | awk 'NR>1' | head -n 1

# 4.3 - What is the largest file?
    # All these files has same size
    ls -lS | head -n 10 | awk 'NR>1'

# 4.4 - What month has more files?
    ls -l | awk '{print $6}' | sort | uniq -c | sort -nr | head -1

# 4.5 - Create a list of files created between 2023-10-15 and 2023-11-15. How many files are there in this period?
    find -type f -newermt 2023-10-15 ! -newermt 2023-11-16 | wc -l

# 4.6 - create a folder for each year and month that have files in this folder, create a copy (use cp -p to
    #preserve the timestamps) of the files that fall into that year and month to the directory
    #and then create a compressed package of it using tar or zip. There are files for 2023 and 2024 only
    
    #cd /mscda5570/assignment1/
    for file in ./*.txt; do
        year=$(ll --time-style="+%Y" "$file" | awk '{print $6}')
        month=$(ll --time-style="+%b" "$file" | awk '{print $6}')
        mkdir -p /mscda5570/assignment1/answers/A00476893_answers/4/$year/$month
        cp -p $file /mscda5570/assignment1/answers/A00476893_answers/4/$year/$month
    done
    