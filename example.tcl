source epg.tcl

set s 101


set j 0
while {$j < 3} {
puts in:$s
puts out:[::epg::markov $s]
incr j
}


exit


puts [::epg::sim ones]
puts [::epg::sim zeroes]
puts [::epg::sim random]
puts [::epg::sim blah]

exit

puts $::epg::examplePrintout
puts [::epg::help]
puts [::epg::frame binary]

exit
puts [::epg::percentClosure [epg::frame zeroes]]
puts [::epg::percentClosure [epg::frame velar]]



puts [::epg::frame {zeroes}]
puts [::epg::frame {velar}]
puts [string length [::epg::frame {velar}]]

puts [::epg::frame {alveolar velar}]
