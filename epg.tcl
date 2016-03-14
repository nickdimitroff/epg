# 
# Copyright (c) 2016 Nicholas Dimitroff Williams
#
# Released under The MIT License, see file LICENSE for text
#

namespace eval ::epg:: { 
 set version 0.0.1
 set one "hello"

set exampleBinary "11100000111000001110000011100000111000001110000011100000111000"

 set examplePrintout "
 .......  
........
........
........
........
........
........
OOOOOOOO
"
} 




#------------- VISUALIZATION

proc ::epg::visualize {style} {
}



#------------- SIMULATION


# build a frame with articulatory features specified
# or random, zeroes, ones. alveolar, palatal, velar, etc.
proc ::epg::frame {features} {
 set blank "aaaaaa000000000000000000000000000000000000000000000000vvvvvvvv"

 if {[regexp "velar" $features]} { regsub -all "v" $blank "1" blank }
 if {[regexp "alveolar" $features]} { regsub -all "a" $blank "1" blank }

puts $blank

 if {$features eq "zeroes"} {
 return [string repeat 0 62]
 } elseif {$features eq "binary"} {
   for {set i 1} {$i < 63} {incr i} { lappend binary [expr int([expr rand() *2])] }
   regsub -all {\s} $binary "" binary
   return $binary
 } 

}


#------------- VALIDATION


proc ::epg::validate {type} {
# printout or binary
 if {$type eq "printout"} {
 } elseif {$type eq "binary"} {
 } else {return -code error "need to pick a type to validate"}
}

proc ::epg::convert {type input} {
 # binary -> printout
 # printout -> binary

}



proc ::epg::help {} {
 foreach x [lsort [info procs ::epg::*]] {
  puts "$x [info args $x]"
 }
}


#
# ::epg::validateBinary
# in: one string
# out: 1 if that string is 62 digits of 1 and 0. otherwise: 0.
#

proc ::epg::validateBinary {binary} {
 if {[regexp {^[10]{62}$} $binary]} {
  return 1
 } else { 
  return 0
 }
}

#------------ CONVERSION

proc ::epg::printout->binary {printout} {
}

proc ::epg::binary->printout {binary} {
 set breaks " 6 14 22 30 38 46 54 "
 set a 0
 puts \n
 puts -nonewline " "
 foreach x $binary {
  regsub "1" $x "O" x     
  regsub "0" $x "." x     
  incr a
  puts -nonewline $x
  if {[regexp " $a " $breaks]} {puts ""}
 }
}



#------------ ANALYSIS

proc ::epg::percentClosure {binary} {
 set sum 0
 set len [string length $binary]
 foreach x [split $binary ""] {
  set sum [expr {$sum + $x}]
 }
# puts $sum
# puts $len
 set m [expr {($sum * 1.0) / ($len * 1.0)}]
 set n [expr {round($m*100)}]
 return $n 
}

proc ::epg::maxClosure {place binary} {
}

proc ::epg::centerOfGravity {area} {
# global, anterior, posterior, more?
}


#------------ HOUSEKEEPING

package provide epg $epg::version


pkg_mkIndex -verbose [file dirn [info scr]] [file tail [info scr]]
