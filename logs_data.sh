# The folder old_logs contains a number of application server, scheduler and other logs for a large-ish PeopleSoft deployment

# 2.1 - Among all the logs available find the number of unique user ids that interacted with the application.
    grep -ho 'U[0-9]\{6\}' *.LOG | sort | uniq | wc -l

# 2.2 - File containing the highest number of warnings? Warnings = warn, Warn, WARN, Warning, ...
    grep -i -c 'warn\|warning' *.LOG | sort -t : -k 2 -nr | head -n 1

# 2.3 - On the file APPSRV_0323.LOG what is the Uid that appears the most
    # Using grep
    grep -o 'U[0-9]\{6\}' APPSRV_0323.LOG | sort | uniq -c | sort -nr | head -n 1

# 2.4 - Replacing all occurrences of “evilcorp” (or any case variant like Evilcorp or EVILCORP) in all logs by “goodishcorp”.
    sed -i 's/evilcorp/goodishcorp/gI' *.LOG