***Work in progress, still a sketch***

# Electropalatography processing library

## How to use epg.tcl

1. Put **epg.tcl** in the same directory as the script you are building.
2. Add `source epg.tcl` to the beginning of your script like in **example.tcl**

### File reading and writing
### Data validation
### Analysis
- return status of a single sensor
- return percent closure (for full set of sensors or per place-of-articulation)
- return best-guess of place-of-articulation (alveolar, palatal, etc.)
### Simulation
- generate frame with different place-closures (full closure or with randomness)
- generate frame with random closures
- generate frame different by one closure wrt. an input frame (e.g., build a series of frames which changes only by one closure each time)
- allow for interruptions? what happens if we say sensory x or y are not functioning?


