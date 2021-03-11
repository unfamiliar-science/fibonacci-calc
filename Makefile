
all: fib-rec.png fibo-dp.png

clean:
	rm -rf *.dat *.png



fib-rec.png: fib-rec.dat
	echo \
		'set terminal pngcairo size 1920, 1080;' \
		'set out "$@";' \
		'set tics font "VL P Gothic,50";' \
		'set lmargin 30;' \
		'set rmargin 12;' \
		'set tmargin 3;' \
		'set bmargin 10;' \
		'set key font "VL P Gothic,50";' \
		'set key left top reverse Left width -10;' \
		'set xlabel font "VL P Gothic,50";' \
		'set xlabel "N";' \
		'set xlabel offset 0,-5;' \
		'set xtics offset 0, -2;' \
		'set ylabel font "VL P Gothic,50";' \
		'set ylabel "実行時間 (sec)";' \
		'set ylabel offset -15,0;' \
		'plot "$<" using 1:2 with linespoints ps 5 ti "安直法";' \
	| gnuplot

fib-rec.dat:
	rm -f $@
	N=10; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=20; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=30; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=40; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=41; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=42; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=43; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=44; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@
	N=45; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js rec $$N 2>&1 | tail -n1) >>$@



fib-dp.png: fib-dpa.dat fib-dpn.dat
	echo \
		'set terminal pngcairo size 1920, 1080;' \
		'set out "$@";' \
		'set tics font "VL P Gothic,50";' \
		'set lmargin 30;' \
		'set rmargin 12;' \
		'set tmargin 3;' \
		'set bmargin 10;' \
		'set key font "VL P Gothic,50";' \
		'set key left top reverse Left width -10;' \
		'set xlabel font "VL P Gothic,50";' \
		'set xlabel "N";' \
		'set xlabel offset 0,-5;' \
		'set xtics offset 0, -2;' \
		'set xtics 0, 20000000, 100000000;' \
		'set ylabel font "VL P Gothic,50";' \
		'set ylabel "実行時間 (sec)";' \
		'set ylabel offset -15,0;' \
		'plot "fib-dpa.dat" using 1:2 with linespoints ps 5 ti "配列利用するver.",' \
		'     "fib-dpn.dat" using 1:2 with linespoints ps 5 ti "配列利用しないver.";' \
	| gnuplot

fib-dpa.dat:
	rm -f $@
	N=1000000;   echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=10000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=20000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=30000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=40000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=50000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=60000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=70000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=80000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=90000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@
	N=100000000; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpa $$N 2>&1 | tail -n1) >>$@

fib-dpn.dat:
	rm -f $@
	N=1000000;   echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=10000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=20000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=30000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=40000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=50000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=60000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=70000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=80000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=90000000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@
	N=100000000; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js dpn $$N 2>&1 | tail -n1) >>$@



fib-mat.png: fib-mat.dat
	echo \
		'set terminal pngcairo size 1920, 1080;' \
		'set out "$@";' \
		'set tics font "VL P Gothic,50";' \
		'set lmargin 30;' \
		'set rmargin 12;' \
		'set tmargin 3;' \
		'set bmargin 10;' \
		'set nokey;' \
		'set xlabel font "VL P Gothic,50";' \
		'set xlabel "Nの桁数";' \
		'set xlabel offset 0,-5;' \
		'set xtics offset 0, -2;' \
		'set xtics 0, 20000, 100000;' \
		'set ylabel font "VL P Gothic,50";' \
		'set ylabel "実行時間 (sec)";' \
		'set ylabel offset -15,0;' \
		'plot [] [0:0.5] "$<" using 1:2 with linespoints ps 5;' \
	| gnuplot

RND = `< /dev/urandom tr -dc "0-9" | head -c$$N; echo`

fib-mat.dat:
	rm -f $@
	N=1000;   echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=10000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=20000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=30000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=40000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=50000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=60000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=70000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=80000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=90000;  echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@
	N=100000; echo $$N $$(/usr/bin/time -f "%e" node ./fibo.js mat $(RND) 2>&1 | tail -n1) >>$@



