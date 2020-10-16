set terminal postscript eps enhanced 22 color size 10cm,7cm

# provide the output graphic file name
set output "u-ndof_highres.eps"

# provide the title of the graph
set title "" 

# set the size of the graph
set size 2,2

# give x axis name to be displayed
set xlabel "number of equations"

# give y axis name to be displayed
set ylabel "uy at point A"

# scaling of the axis
set logscale x


# set the range of values along x- and y-axis
set xrange [1000:105000]
set yrange [8.5:9.2]



# grid display ON/OFF
set grid

# key legend
set key 

# set plot styles (line color, style etc.)
# set style line 1 lt 1 lc rgb 'red' lw 2 pt 1 ps 3
# set style line 2 lt 2 lc rgb 'blue'  lw 2 pt 2 ps 3
# set style line 3 lt 3 lc rgb 'green' lw 2 pt 3 ps 3
# set style line 4 lt 4 lc rgb 'green' lw 2 pt 4 ps 3
set style line 1 lt 1 lw 2 pt 1 ps 3
set style line 2 lt 2 lw 2 pt 2 ps 3
set style line 3 lt 3 lw 2 pt 3 ps 3
set style line 4 lt 4 lw 2 pt 4 ps 3
set style line 5 lt 5 lw 2 pt 5 ps 3
# lt: line type label
# lc: line color
# lw: line width
# pt: point type
# ps: point size

show label

show output

# generate plot from .dat file
plot "u-ndof_t1.dat" using 1:2 w lp ls 1 title "t1 (diagonal)",\
 "u-ndof_t1_cross.dat" using 1:2 w lp ls 2 title "t1 (cross pattern)",\
 "u-ndof_t2.dat" using 1:2 w lp ls 3 title "t2 (diagonal)" ,\
 "u-ndof_q1.dat" using 1:2 w lp ls 4 title "q1" ,\
 "u-ndof_q2.dat" using 1:2 w lp ls 5 title "q2"
# using 1:2: x-data: first colum, y-data: second column of .dat file
# w lp ls 1 = with linespoints ls 1: connect the dots


# reference: GNUPLOT: http://gnuplot.info/










































































