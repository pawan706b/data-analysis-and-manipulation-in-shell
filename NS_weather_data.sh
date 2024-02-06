# 5.1 - Downloading data for station weathers with Halifax in the name for 2023,
        # creating a file halifax_2023.csv
        # compressing it.

    # METHOD #1 - download then filter
  
    # Extracting 2023 files only and saving them to a text file
    curl --silent https://dd.weather.gc.ca/climate/observations/daily/csv/NS/ | sed 's/.*href="//g' | sed 's/csv".*/csv/g' | egrep "^climate_daily_NS_.*_2023-" | xargs -I % echo https://dd.weather.gc.ca/climate/observations/daily/csv/NS/% > links.txt
    # Downloading data from the links file
    cat links.txt | xargs -P 10 wget
    # Saving them to single file
    cat climate_daily_NS_* | grep HALIFAX > halifax_2023.csv
    # Zipping it
    gzip halifax_2023.csv

    # METHOD #2 - Filtering while downloading
    # Extracting Halifax 2023 weather files only
    curl --silent https://dd.weather.gc.ca/climate/observations/daily/csv/NS/ | sed 's/.*href="//g' | sed 's/csv".*/csv/g' | egrep "^climate_daily_NS_.*_2023-" | xargs -I % echo https://dd.weather.gc.ca/climate/observations/daily/csv/NS/% | xargs -P 0 curl | grep HALIFAX > halifax_2023.csv
    # Zipping it
    gzip halifax_2023.csv

# 5.2
    awk -F ',' 'BEGIN {min_temp = 0; coldest_date = 0} { if ($12 != "" && $12 < min_temp) {min_temp = $12; coldest_date = $5}} END {print "Coldest date: ", coldest_date; print "Min temp: ", min_temp}' halifax_2023.csv
