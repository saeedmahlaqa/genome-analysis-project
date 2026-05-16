set terminal png tiny size 800,800
set output "out.png"
set xtics rotate ( \
 "NC_017963.1" 1.0, \
 "NC_017960.1" 251926.0, \
 "NC_017962.1" 2950062.0, \
 "*NC_017961.1" 3016308.0, \
 "" 3052572 \
)
set ytics ( \
 "tig00000009" 1.0, \
 "tig00000002" 24948.0, \
 "tig00000001" 224329.0, \
 "*tig00000003" 2986803.0, \
 "tig00000004" 3009574.0, \
 "*tig00000005" 3024307.0, \
 "tig00000008" 3064319.0, \
 "*tig00000007" 3079746.0, \
 "tig00000012" 3095789.0, \
 "tig00000006" 3100013.0, \
 "" 3115034 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:3052572]
set yrange [1:3115034]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "out.fplot" title "FWD" w lp ls 1, \
 "out.rplot" title "REV" w lp ls 2
