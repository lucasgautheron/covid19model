set datafile separator ","
set key autotitle columnheader

set xdata time
set timefmt "%Y-%m-%d"
#set xrange ["2020-02-15":"2020-03-31"]
#set logscale y
#plot '../deaths_France.csv' u 2:13, '' u 2:14 w l, '' u 2:15 w l, '' u 2:16 w l#, '' u 2:17
plot '../deaths_France.csv' u 2:($14-$17), '' u 2:($15-$18), '' u 2:($16-$19)

pause -1
