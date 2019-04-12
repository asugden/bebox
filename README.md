#BEBOX

BeBox is a collection of tools for systems neuroscience. It includes three parts: designs for 3d printing, circuits and printed circuit boards (PCBs) for behavioral manipulation, and the Arduino code necessary for those circuits.

Many people are interested in only the 3d designs. In that case, all necessary hardware components are listed in the 3d designs directory. If you are interested in electronics, the BeBox Spritz and the BeBox Syringe Pump can both be used indepent of the BeBox system. The syringe pump can be integrated with BeBox. To start with BeBox, one has to order the boards (links can be found in the pcb directory), which come in orders of 3 from OSH Park, my preferred supplier. Note that BeBox is connected by 4-conductor headphone cables. They can be a bit hard to find. 3-conductor cables will not work.

##3D DESIGNS:
__All necessary components are listed in the README in the 3d directory.__

- .stl files  are final output files to be used with 3D printers.
- .scad files  are files written in OpenSCAD which define the .stl files and can be edited
- Some designs are made in Fusion 360 and are available upon request.

###bebox
- bebox bnc bottom.stl  the bottom of a case to hold bnc connectors for bebox
- bebox bnc top.stl  the top of the case to hold bnc connectors for bebox, which can have magnets inserted to allow stacking
- bebox button bottom.stl  the bottom of a case to hold bebox buttons, which also reports licks
- bebox button top.stl  the top of the case to hold bebox buttons
- bebox button 1.stl  a button cap with the number 1
- bebox button 2.stl  a button cap with the number 2
- bebox button 3.stl  a button cap with the number 3
- bebox button 4.stl  a button cap with the number 4
- bebox button e.stl  a button cap with the number e, for ensure
- bebox button q.stl  a button cap with the letter q, for quinine
- bebox main bottom.stl  the bottom of the case to hold the main bebox board
- bebox main top.stl  the top of the case to hold the main bebox board

###lickspout
__NOTE:__ the lickspouts should be printed with conductive PLA if conductive measurement is desired. The lickspout base should be printed in regular PLA. Conductive PLA plastic can be found at https://www.proto-pasta.com/collections/exotic-composite-pla/products/conductive-pla

- lickspout bitube.stl  a pre-made file to be printed with conductive filament that has two tubes, one regularly used for ensure high-calorie milkshake and one used for quinine diluted in water. This is designed for Tygon tubing of 1/16 inch inner diameter and 1/8 inch outer diameter (1.6 mm ID/3.2 mm OD). 
- lickspout unitube.stl  a pre-made file to be printed with conductive filament that has a single tube with a collection area, for training on only a high-calorie milkshake
- lickspout.scad  the file used to create both lickspout bitube and lickspout unitube. Adjustments can be made to the tube diameters at the top. Note that the curved pipe library is required for making changes: https://www.thingiverse.com/thing:71464
- lickspout bitube water.stl  a pre-made file to be printed with conductive filament that has two narrow-diameter tubes. The input tubing should be the same diameter, but the flow rate is decreased
- lickspout water.scad  the file used to create lickspout bitube water.stl. This, too, depends on the curved pipe library
- utilities.scad  a set of useful functions for OpenSCAD

###syringe-pump
The syringe pump is designed to tightly fit 20 ml syringes. All necessary mechanical and electrical components are listed in the README of the syringe 

- syringe pump box.stl  a file that defines the enclosure of the syringe pump including the motor and carriage
- syringe pump carriage.stl  the carriage that rides along bearings to compress the syringe. Note that it should be printed vertically rather than on a flat face.

###wheel
- wheel.stl  a pre-made file that can be printed on an average FDM printer with minimal layer heights. This requires two M4 nuts to be embedded and two M4x10 bolts to pinch the axles. I recommend using black PLA for the wheel as other colors may not correctly block the IR light of a beam breaker. We had problems with gray PLA being transparent to IR light.
- wheel axle.stl  a pre-made file of a short axle piece used to attach the wheel to the wheel holder. 2 are required
- wheel holder.stl  a pre-made file of a suspension system for the wheel, designed to fit into standard Thorlabs pieces. Requires two bearings from McMaster-Carr catalog number 57155K323 at $5.70 each to be inserted into the large central holes with the flanges outward. We hot glue them in, taking care not to get the glue into the bearings.
- wheel.scad  the file used to create wheel.stl. The wheel height, diameter, and tab spacing can all be changed. Note that a finer tab spacing requires narrower LED beam break detectors-- do not change without changing the encoder board.
- wheel holder.scad  the file used to create wheel axle.stl. The spring width, length, and thickness can all be adjusted and the wheel position will remain constant.

###wheel-accessories
- wheel run stopper.stl  a pre-made file that fits into a thorlabs part and applies some resistance to the wheel without disrupting its low inertia/springiness
- wheel run stopper.scad  the file used to create wheel run stopper.stl

###wheel-encoder
__NOTE:__ will be udpated in the near future

- wheel arduino holder.stl  a file to hold two LED beam breakers adjacent to the wheel
- wheel encoder board holder.stl  a file to allow an arduino to be bolted on to the holder such that it can be held next to the wheel


##ARDUINO CODE:
__NOTE:__ Has not yet been made compatible with the new BeBox system. Will be updated soon.

- BeBox  the code to run the BeBox system
	- mpr121.h  the header definitions required for the capacitance lick detection system

- Dumberbox  the code used to run the legacy Dumbberbox
- Encoder_Scanbox  the code used to run the legacy scanbox rotary encoder. Will be replaced with BeBox encoder software in early April 2019.


##PCB DESIGNS:
__All necessary components are listed in the README in the pcb directory.__

- .brd files  board files, matched with their schematic file, made in Eagle. You can bypass dealing with these files by directly ordering from OSH Park through a link I've set up. I am not affiliated with OSH Park.
- .sch files  schematic files, matched with a board file, made in Eagle. 

__NOTE:__  PCBs can be ordered from OSH Park for low costs. As of now, they are untested so please wait until late March 2019

- bebox_main  the main board, which takes power and connects directly to high-current behavior systems such as solenoids. It passed on the power given to it (usually 12V 2A supply, but can be 6-13 V and > 1 A). It connects via headphone cables to the daughter boards and lick spout. The connection ports are interchangeable.
- bebox_bnc  a daughterboard that allows for connections with Matlab via a Nidaq BNC system. It includes the lick detection and 4 output solenoids
- bebox_buttons  a daughterboard that allows control of solenoids and reports licking. There are two lick detection LEDs, just in case, and four buttons to control solenoids.
- bebox_encoder  a board that holds the rotary encoder IR beam breakers adjacent to the running wheel. This board can be configured in one of three ways: 
	1. For connection to the BeBox system, one can solder on an Adafruit Metro Mini (an Arduino Uno clone that has been miniaturized) and the i2c headphone jack. This will allow BeBox to directly interact with the running encoder. 
	2. To connect to Neurolabware's Scanbox, one can solder on an Adafruit Metro Mini and no headphone jacks. This can be plugged directly into the Scanbox computer via USB and it will be indistinguishable from an Arduino Uno.
	3. To use this with systems sensitive to electrical noise (electrophysiology), one can solder on the "ephys only" headphone jack, which transmits ground, power, and the output of the two beam breakers. This i2c cable can pass outside of a faraday cage to an external Arduino.
