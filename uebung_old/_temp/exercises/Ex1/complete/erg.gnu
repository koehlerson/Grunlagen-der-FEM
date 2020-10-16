set terminal postscript eps colour solid 18
set output "erg.eps"
set size 1.5, 1.5
set xrange [0:1]
set yrange [0:0.14]
set xtics 0.2
set xlabel "Stablaenge l"
set ylabel "Verschiebung u(x)"
#set grid
set key right box
set style line 1 lt 1 lw 5
set style line 2 lt 2 lw 5 pt 4 ps 3
set style line 3 lt 3 lw 5 pt 6 ps 3
set style line 4 lt 4 lw 5 pt 8 ps 3
show output

plot \
     0.5*(-x**2+x) title 'analy' w l ls 1,\
     "beispaus02.dat" using 1:2 title 'n=2'  w lp ls 2,\
     "beispaus04.dat" using 1:2 title 'n=4'  w lp ls 3,\
     "beispaus11.dat" using 1:2 title 'n=11' w lp ls 4
