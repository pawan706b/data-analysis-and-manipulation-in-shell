# File name: tablespace_and_tables.csv

# 1.1 - Tablespace with the highest number of tables
awk 'NR>4 {arr[$1]++}END{max_count=0; max_tablespace=""; for (tablespace in arr) {if (arr[tablespace] > max_count) { max_tablespace=tablespace; max_count=arr[tablespace]}} print "Highest Tablespace:", max_tablespace, "Count:", max_count }' tablespace_and_tables.csv

# 1.2 - Largest table in number of rows
sort -r -n -k 3 tablespace_and_tables.csv | head -1 | awk '{largest_table=$2}; END{print "Largest table is", largest_table; print " with rows: ", $3}'

# 1.3 - Largest table multiplying the number of rows with the avg_row_len
awk 'NR>4 {product = $3 * $4; if (result > max_result) {max_result = result; table = $3} END {print "Highest Table:", table, print " with Value: ", max_result}' tablespace_and_tables.csv