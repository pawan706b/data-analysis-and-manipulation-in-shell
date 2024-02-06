# The file netlogs/2055-20161219.txt.gz contains network switch logs with source ip, source port, destination ip, destination port and protocol

# 3.1 - How many rows the file netlogs/2055-20161219.txt.gz have?
    zcat netlogs/2055-20161219.txt.gz | wc -l

# 3.2 - Create a file called source_ips containing the unique values of the first column of netlogs/2055-20161219.txt.gz
    # The files are tried out locally after downloading the zip as write permission was not given on the server
    # As the file is already unzipped
    cat 2055-20161219.txt | awk 'NR>1 {print $1}' | uniq > source_ips.txt

# 3.3 - What is the ip that appears the most as the source ip on netlogs/2055-20161219.txt.gz?
    # Using only cat as the file is already unzipped
    cat 2055-20161219.txt | awk 'NR>1 {print $1}' | sort | uniq -c | sort -nr | head -n 1

# 3.4 - What is the ip that appears the most as the destin ip on netlogs/2055-20161219.txt.gz?
    # Using only cat as the file is already unzipped
    cat 2055-20161219.txt | awk 'NR > 1 {print $3}' | sort | uniq -c | sort -nr | head -n 1

# 3.5 - What destination port (4th column) appears the most in the file netlogs/2055-20161219.txt.gz? (1 point)
    cat 2055-20161219.txt | awk ' NR>1 {print $4}' | sort | uniq -c | sort -nr | head -n 1

# 3.6 - For the source ip's that start with “10.” create a file for each ip containing all the data related to that ip. For example if a row has 10.0.0.1 as the source ip, the entire row should go to a file named 10.0.0.1.
    cat 2055-20161219.txt | awk 'NR>1 && $1 ~ /^10\./ {print >> $1}'