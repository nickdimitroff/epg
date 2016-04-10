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
....OO..
........
........
OOOOOOOO
"
} 




#------------- VISUALIZATION

proc ::epg::visualize {style} {
}



#------------- SIMULATION

proc ::epg::sim {type} {
 
 if {$type eq "random"} {
 for {set i 1} {$i < 63} {incr i} { lappend binary [expr int([expr rand() *2])] }
 regsub -all {\s} $binary "" binary
 return $binary
 }
 if {$type eq "zeroes"} { return [string repeat 0 62] } 
 if {$type eq "ones"} { return [string repeat 1 62] }
}

# in: binary string
# out: input with one digit flipped
# 100% -> must change
# 0 must not change
proc ::epg::markovX {in probChange} {
 if {$probChange > 100 || $probChange < 0} {return "probability range error"}
}

# in: binary string
# out: input with one digit flipped
# index starts at character zero
proc ::epg::markov {x} {
 set s [string length $x]
 set r [expr rand()]
 set rs [expr {$s * $r}]
 set p [expr int($rs)]
 set c [string index $x $p]
 puts "flip char $c position $p"
 puts ..$p..
 # not accepting $p as a valid index for the character, but not erroring
 if {$c eq 1} {
  set x [string replace $x $p $p 1]
 } elseif {$c eq 0} {
  set x [string replace $x $p $p 0]
 } else {
  return "input error"
 }
return $x
}



### verify and add in other places of articulation
proc ::epg::frame {features} {
 set x "aaaaaa000000000000000000000000000000000000000000000000vvvvvvvv"
 if {[regexp "velar" $features]} { regsub -all "v" $x "1" x }
 if {[regexp "alveolar" $features]} { regsub -all "a" $x "1" x }
 regsub -all {a|v|p|v|l} $x "0" x
 return $blank 
}


#------------- VALIDATION


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


#------------ MISCELLANEOUS 


proc ::epg::help {} {
 foreach x [lsort [info procs ::epg::*]] {
  puts $x
#  puts "$x [info args $x]"
 }
}

#------------ HOUSEKEEPING

package provide epg $epg::version


pkg_mkIndex -verbose [file dirn [info scr]] [file tail [info scr]]
