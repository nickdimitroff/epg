source epg.tcl

puts [::epg::percentClosure [epg::frame zeroes]]
puts [::epg::percentClosure [epg::frame velar]]

puts [::epg::frame {zeroes}]
puts [::epg::frame {velar}]
puts [string length [::epg::frame {velar}]]

puts $::epg::examplePrintout

puts [::epg::frame {alveolar velar}]
