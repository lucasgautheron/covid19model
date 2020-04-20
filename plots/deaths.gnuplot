set datafile separator ","
set key autotitle columnheader

set xdata time
set timefmt "%Y-%m-%d"
plot 'deaths_France.csv' u 2:13, '' u 2:14, '' u 2:17
