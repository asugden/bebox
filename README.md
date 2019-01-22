#BEBOX-BOARDS

BeBox is a collection of tools used to control and measure animal behavior. It includes four parts: finished 3d designs, the code used to generate them, the Arduino code necessary to run, and a set of PCB files.

##3d designs:

###wheel
- wheel.stl  a pre-made file that can be printed on an average FDM printer with minimal layer heights. This requires two M4 nuts to be embedded and two M4x10 bolts to pinch the axles
- wheel axle.stl  a pre-made file of a short axle piece used to attach the wheel to the wheel holder. 2 are required
- wheel holder.stl  a pre-made file of a suspension system for the wheel, designed to fit into standard Thorlabs pieces. Requires two bearings from McMaster-Carr catalog number 57155K323 at $5.70 each to be inserted into the large central holes with the flanges outward. We hot glue them in, taking care not to get the glue into the bearings.
- wheel.scad  the file used to create wheel.stl. The wheel height, diameter, and tab spacing can all be changed. Note that a finer tab spacing requires narrower LED beam break detectors-- do not change without changing the encoder board.
- wheel holder.scad  the file used to create wheel axle.stl. The spring width, length, and thickness can all be adjusted and the wheel position will remain constant.

wheel-accessories
- wheel run stopper.stl  a pre-made file that fits into a thorlabs part and applies some resistance to the wheel without disrupting its low inertia/springiness
- wheel run stopper.scad  the file used to create wheel run stopper.stl

wheel-encoder
NOTE: will be udpated in the near future
- wheel arduino holder.stl  a file to hold two LED beam breakers adjacent to the wheel
- wheel encoder board holder.stl  a file to allow an arduino to be bolted on to the holder such that it can be held next to the wheel


arduino code:
NOTE: Has not yet been made compatible with the new BeBox system. Will be updated soon.
- BeBox.ino  the code to run the BeBox system
- mpr121.h  the header definitions required for the capacitance lick detection system


pcb designs:
PCBs can be ordered from OSH Park for low costs. As of now, they are untested so please wait ~3 weeks
- bebox.brd  the main board, which takes power and connects directly to high-current behavior systems such as solenoids. It passed on the power given to it (usually 12V 2A supply, but can be 6-13 V and > 1 A). It connects via headphone cables to the daughter boards and lick spout. The connection ports are interchangeable.
- bebox.sch  the associated schematic
- bebox_bnc.brd  a daughterboard that allows for connections with Matlab via a Nidaq BNC system. It includes the lick detection and 4 output solenoids
- bebox_bnc.sch  the associated schematic
- bebox_buttons.brd  a daughterboard that allows control of solenoids and reports licking. There are two lick detection LEDs, just in case, and four buttons to control solenoids.
- bebox_buttons.sch  the associated schematic

