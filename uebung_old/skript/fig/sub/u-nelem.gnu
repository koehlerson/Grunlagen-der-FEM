set terminal postscript eps enhanced 22 color size 10cm,7cm

# provide the output graphic file name
set output "u-nelem.eps"

# provide the title of the graph
set title "" 

# set the size of the graph
set size 1.5,1.5

# Dezimalzahlen mit Komma statt Punkt
set decimalsign ","

# give x axis name to be displayed
set xlabel "{number of elements}"

# give y axis name to be displayed
set ylabel "{uy @ point A}"

# automatische Skalierung der Achsen
set autoscale

# set the range of values along x- and y-axis
set xrange [0:26000]
set yrange [5.0:10]

# x-Achse mit 1 Nachkommastelle
#set format x "%.1f" 

#set x and y axis tick marks
#set xtics 0.2
#set ytics 10

# grid display ON/OFF
set grid

#set key  1,0.65 right
#set nokey

# set plot styles (line color, style etc.)
set style line  1 lt  1 lc  rgb 'blue'      lw 2  pt 7 ps 1
#set style line  2 lt  1 lc  rgb 'red'       lw 4  pt 9 ps 1.3
#set style line  3 lt  1 lc  rgb 'grey30'    lw 4  pt 13 ps 1.3
#set style line  4 lt  1 lc  rgb 'black'     lw 8  pt 6 ps 2

show label

show output

plot "u-nelem.dat" using 1:2 w lp ls 1


# give the plot data
#plot "u-nelem.dat"      using      (100*$1):($2)      title '{x}_1-Richtung'  w linespoints ls 1, \
#     "results_stre.txt"      using      (100*$3):($4)      title '{x}_2-Richtung'  w linespoints ls 2, \
#      filename               x-axis:y-axis

# Reference to find out more regarding GNUPLOT: http://gnuplot.info/















































































