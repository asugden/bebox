__NOTE: I get no money from this and have no affiliation with OSH Park.__

## BeBox Main Trinket components

__CONFIRMED TO WORK__: https://oshpark.com/shared_projects/5AUOipvb

After creating this PCB, the Trinket became deprecated. I have created a newer, faster version based on the Adafruit ItsyBitsy M4.

| Part name            | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|----------------------|-------|---------------|------------|---------|--------------------| 
| headone jack         | 4     | 1.66          | 6.64       | Digikey | CP-435107RS-ND     | 
| 4.7k resistor        | 6     | 0.10          | 0.60       | Digikey | CF14JT4K70CT-ND    | 
| power jack           | 1     | 0.76          | 0.76       | Digikey | CP-102AH-ND        | 
| screw terminal       | 4     | 0.75          | 3.00       | Digikey | ED2740-ND          | 
| switch               | 1     | 11.56         | 11.56      | Digikey | 679-3961-ND        | 
| diode                | 4     | 0.11          | 0.44       | Digikey | 641-1310-1-ND      | 
| transistor           | 4     | 0.70          | 2.80       | Digikey | TIP122GOS-ND       | 
| adafruit pro trinket | 1     | 9.95          | 9.95       | Digikey | 1528-1039-ND       | 

## BeBox Main ItsyBitsy components

https://oshpark.com/shared_projects/iDtDUlNY

This new version is based on the Adafruit ItsyBitsy M4, but requires conversion for logic levels.

| Part name              | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|------------------------|-------|---------------|------------|---------|--------------------| 
| headone jack           | 4     | 1.66          | 6.64       | Digikey | CP-435107RS-ND     | 
| 4.7k resistor          | 8     | 0.10          | 0.60       | Digikey | CF14JT4K70CT-ND    | 
| power jack             | 1     | 0.76          | 0.76       | Digikey | CP-102AH-ND        | 
| screw terminal         | 4     | 0.75          | 3.00       | Digikey | ED2740-ND          | 
| switch                 | 1     | 11.56         | 11.56      | Digikey | 679-3961-ND        | 
| diode                  | 4     | 0.11          | 0.44       | Digikey | 641-1310-1-ND      | 
| transistor             | 4     | 0.70          | 2.80       | Digikey | TIP122GOS-ND       | 
| adafruit itsybitsy m4  | 1     | 9.95          | 9.95       | Digikey | 1528-1039-ND       | 
| logic level transistor | 2     | 0.47          | 0.94       | Digikey | 2N7000FS-ND        | 
| 5V regulator           | 1     | 6.81          | 20.43      | Digikey | 945-1037-ND        | 

## BeBox BNC components

__CONFIRMED TO WORK__: https://oshpark.com/shared_projects/NPiqw07m

This box breaks out BNCs for communication with NIDAQ boards or the like. Currently, there is only a single lick output. Although the rest of BeBox can handle two capacitive sensors, the BNC board is not yet adapted for 4 solenoids and 2 licks. It is easy to change the code such that one of the solenoid inputs can be converted to a second lick output.

| Part name       | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|-----------------|-------|---------------|------------|---------|--------------------| 
| bnc onnector    | 5     | 1.65          | 8.25       | Digikey | A97555-ND          | 
| headphone jack  | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND     | 
| i2c io expander | 1     | 1.05          | 1.05       | Digikey | MCP23008-E/P-ND    | 
| 4.7k resistor   | 5     | 0.10          | 0.50       | Digikey | CF14JT4K70CT-ND    | 

## BeBox Button components

__CONFIRMED TO WORK__: https://oshpark.com/shared_projects/y1Swevmm

This box has buttons to control solenoids, as well as two LEDs that represent responses to different capacitance inputs. Our printer and slicer do a poor job keeping the inside of the LED holes clean, so it sometimes needs to be cleaned out with a 5 mm / 3/16 inch drill bit.

| Part name       | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|-----------------|-------|---------------|------------|---------|--------------------| 
| headphone jack  | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND     | 
| i2c io expander | 1     | 1.05          | 1.05       | Digikey | MCP23008-E/P-ND    | 
| switch (cherry) | 4     | 0.90          | 3.60       | Digikey | CH310-ND           | 
| 330 resistor    | 2     | 0.10          | 0.20       | Digikey | CF14JT330RCT-ND    | 
| red led         | 1     | 0.33          | 0.33       | Digikey | 160-1853-ND        | 
| yellow led      | 1     | 0.33          | 0.33       | Digikey | 160-1851-ND        | 

## BeBox cables

You need 4-conductor 3.5 mm headphone cables to connect BeBox components. They can be any length. Two cables are required for the main 3 boxes, but more need to be used for the encoder or syringe pump. Below are options– you can choose how many to order of each size.

| Part name  | Count | Cost per part | Total cost | Vendor    | Vendor part number | 
|------------|-------|---------------|------------|-----------|--------------------| 
| 1' cable   | 1     | 1.50          | 1.50       | Digikey   | CAB-14163-ND       | 
| 3' cable   | 1     | 2.50          | 2.50       | Digikey   | CAB-14164-ND       | 
| 6' cable   | 1     | 6.45          | 6.45       | Digikey   | CP-354S-M/M-ND     | 
| 1' cable   | 1     | 1.89          | 1.89       | Monoprice | 24437              | 
| 3' cable   | 1     | 2.29          | 2.29       | Monoprice | 18632              | 
| 6' cable   | 1     | 2.59          | 2.59       | Monoprice | 18633              | 

## BeBox Capacitance Lickspout components

__CONFIRMED TO WORK__

There is no PCB here. We simply order a capacitance-sensing board and wire in the 4-conductor headphone cable. One prints a capacitance lickspout, uses an M3 bolt to fasten it to the lickspout holder, solder headers into the capacitance sensing board, heat a wire and shove it into the lickspout, and then attach it to the capacitance sensing board (again with headers, so that the lickspout can be replaced often).

__CONNECT BLACK -> SCL, YELLOW -> SDA, GREEN -> GND, RED -> VIN__

Note that wires are connected differently from dumberboxes.

| Part name          | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|--------------------|-------|---------------|------------|---------|--------------------| 
| capacitance sensor | 1     | 7.95          | 7.95       | Digikey | CP-435107RS-ND     | 
| 4-conductor wire   | 1     | 6.25          | 6.25       | Digikey | CP-354S-ND         | 
| female header      | 1     | 0.32          | 0.32       | Digikey | S7000-ND           | 

## BeBox Encoder components

https://oshpark.com/shared_projects/I9CImQTS

| Part name           | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|---------------------|-------|---------------|------------|---------|--------------------| 
| ir beam break       | 2     | 3.77          | 7.54       | Digikey | 1855-1043-ND       | 
| 220 resistor        | 2     | 0.10          | 0.20       | Digikey | CF14JT220RCT-ND    | 
|                     |       |               |            |         |                    | 
| OPTIONAL:           |       |               |            |         |                    | 
| adafruit metro mini | 1     | 12.50         | 12.50      | Digikey | 1528-1374-ND       | 
| headphone jack      | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND     | 

This board can be configured in one of three ways: 

1. For connection to the BeBox system, one can solder on an Adafruit Metro Mini (an Arduino Uno clone that has been miniaturized) and the i2c headphone jack. This will allow BeBox to directly interact with the running encoder.  __(both optional components)__
2. To connect to Neurolabware's Scanbox, one can solder on an Adafruit Metro Mini and no headphone jacks. This can be plugged directly into the Scanbox computer via USB and it will be indistinguishable from an Arduino Uno.  __(only optional metro mini)__
3. To use this with systems sensitive to electrical noise (electrophysiology), one can solder on the "ephys only" headphone jack, which transmits ground, power, and the output of the two beam breakers. This i2c cable can pass outside of a faraday cage to an external Arduino.  __(only optional headphone jack)__

## BeBox Syringe Pump components

https://oshpark.com/shared_projects/pRGppHBK

The syringe pump also requires a replaceable 20 ml syringe.

| Part name                                 | Count | Cost per part | Total cost | Vendor  | Vendor part number    | 
|-------------------------------------------|-------|---------------|------------|---------|-----------------------| 
| adafruit itsybitsy m4                     | 1     | 14.95         | 14.95      | Digikey | 1528-2619-ND          | 
| stepper driver                            | 1     | 7.98          | 23.94      | Digikey | 1460-1159-ND          | 
| 5V regulator                              | 1     | 6.81          | 20.43      | Digikey | 945-1037-ND           | 
| oled screen                               | 1     | 19.95         | 19.95      | Digikey | 1528-1512-ND          | 
| switch (cherry MX clear)                  | 1     | 0.90          | 0.90       | Digikey | CH310-ND              | 
| rotary encoder (long)                     | 1     | 1.73          | 1.73       | Digikey | PEC11R-4020F-S0012-ND | 
| forward-backward toggle switch            | 1     | 4.32          | 4.32       | Digikey | 360-3355-ND           | 
| on-off toggle switch                      | 1     | 5.96          | 5.96       | Digikey | M2012S2A2A30-ND       | 
| power jack                                | 1     | 0.76          | 0.76       | Digikey | CP-102AH-ND           | 
| screw terminal                            | 4     | 0.75          | 3.00       | Digikey | ED2740-ND             | 
| heat sink pad                             | 1     | 3.44          | 3.44       | Digikey | 3M10304-ND            | 
| heatsink                                  | 1     | 0.49          | 1.47       | Digikey | AE11388-ND            | 
| logic level transistor                    | 2     | 0.47          | 0.94       | Digikey | 2N7000FS-ND           | 
| 4.7k resistor                             | 4     | 0.10          | 0.40       | Digikey | CF14JT4K70CT-ND       | 
| 3.5mm jack                                | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND        | 
| stepper motor (NEMA 17 200 steps/rev 12V) | 1     | 14.00         | 14.00      | Digikey | 1528-1062-ND          | 

## BeBox Spritz components

https://oshpark.com/shared_projects/YoxiTIt1

This is a device to produce very small amounts of pressure for microinjections or puffing of drugs onto slices.

| Part name                | Count | Cost per part | Total cost | Vendor   | Vendor part number    | 
|--------------------------|-------|---------------|------------|----------|-----------------------| 
| adafruit itsybitsy m4    | 1     | 14.95         | 14.95      | Digikey  | 1528-2619-ND          | 
| 5V regulator             | 1     | 6.81          | 20.43      | Digikey  | 945-1037-ND           | 
| oled screen              | 1     | 19.95         | 19.95      | Digikey  | 1528-1512-ND          | 
| switch (cherry MX clear) | 2     | 0.90          | 1.80       | Digikey  | CH310-ND              | 
| rotary encoder (long)    | 1     | 1.73          | 1.73       | Digikey  | PEC11R-4020F-S0012-ND | 
| on-off toggle switch     | 1     | 5.96          | 5.96       | Digikey  | M2012S2A2A30-ND       | 
| power jack               | 1     | 0.76          | 0.76       | Digikey  | CP-102AH-ND           | 
| 150 resistor             | 1     | 0.10          | 0.10       | Digikey  | CF14JT150RCT-ND       | 
| 5mm red LED              | 1     | 0.33          | 0.33       | Digikey  | 160-1853-ND           | 
| 4.7k resistor            | 1     | 0.10          | 0.10       | Digikey  | CF14JT4K70CT-ND       | 
| diode                    | 1     | 0.11          | 0.11       | Digikey  | 641-1310-1-ND         | 
| transistor               | 1     | 0.70          | 0.70       | Digikey  | TIP122GOS-ND          | 
| screw terminal           | 1     | 0.75          | 0.75       | Digikey  | ED2740-ND             | 
|                          |       |               |            |          |                       | 
| solenoid valve           | 1     | 61.76         | 61.76      | Grainger | 6JJ52                 | 
| pressure regulator       | 1     | 69.90         | 69.90      | Festo    | 159502                | 
