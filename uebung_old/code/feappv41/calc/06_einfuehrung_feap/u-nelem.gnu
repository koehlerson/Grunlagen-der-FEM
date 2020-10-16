set terminal postscript eps enhanced 22 color size 10cm,7cm

# provide the output graphic file name
set output "u-nelem.eps"

# provide the title of the graph
set title "" 

# set the size of the graph
set size 1.5,1.5

# give x axis name to be displayed
set xlabel "number of elements"

# give y axis name to be displayed
set ylabel "uy at point A"

# automatische Skalierung der Achsen
set autoscale

# set the range of values along x- and y-axis
set xrange [0:26000]
set yrange [7.0:10.0]

# grid display ON/OFF
set grid

# disable key legend
set nokey

# set plot styles (line color, style etc.)
set style line 1 lt 1 lc rgb 'black' lw 2 pt 1 ps 3
# lt: line type label
# lc: line color
# lw: line width
# pt: point type
# ps: point size

show label

show output

# generate plot from .dat file
plot "u-nelem.dat" using 1:2 w lp ls 1
# using 1:2: x-data: first colum, y-data: second column of .dat file
# w lp ls 1 = with linespoints ls 1: connect the dots


# reference: GNUPLOT: http://gnuplot.info/















































































