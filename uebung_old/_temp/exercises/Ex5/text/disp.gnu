set terminal postscript eps color 26
set output "disp.eps"
set size 1.,1.
set xlabel "number of elements"
set ylabel "u_y -- Point A"
set xrange [0:26000]
set yrange [0.1:0.125]
#set xtics 0.00025
#set ytics 0.025
set grid
set key  1,0.65 right
set style line 1 lt -1 lw 2 pt 1 ps 2
set style line 2 lt 9 lw 2 pt 9 ps 1.5

set key left top

show label
show output

plot "disp.dat" using 1:2 w lp ls 1









