set terminal svg font 'Geomanist, 16'
set out 'deaths.svg'

set xlabel 'Date'
set ylabel 'Décès cumulés'

set xdata time
set timefmt "%Y-%m-%d"
set format x "%d/%m"

set key left
set key font ",16" tc rgb '#4C4C4C'

set xlabel font ",16" tc rgb '#4C4C4C'
set ylabel font ",16" tc rgb '#4C4C4C'

set border lc rgb '#C3C9C9'

set datafile separator ","
set key autotitle columnheader

set xdata time
set timefmt "%Y-%m-%d"
set xrange ["2020-03-10":"2020-04-20"]

plot '../output/2020-03-14/deaths_France.csv' u 2:13 pt 7 ps 0.5 lc rgb 'black'  t "Décès à l'hôpital", \
 '../output/2020-03-12/deaths_France.csv' u 2:18:19  with filledcurve fc rgb '#6E48AC' fs transparent solid 0.2 notitle, \
 '../output/2020-03-12/deaths_France.csv' u 2:17 t 'Confinement le 13/03' w l lc rgb '#6E48AC' lw 2, \
 '../output/2020-03-10/deaths_France.csv' u 2:18:19  with filledcurve fc rgb '#E93A56' fs transparent solid 0.2 notitle, \
 '../output/2020-03-10/deaths_France.csv' u 2:17 w l lc rgb '#E93A56' lw 2 t 'le 11/03', \
 #'../output/2020-03-12/deaths_France.csv' u 2:17 t 'Confinement le 13/03' w l, \


