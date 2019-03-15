## BeBox Main components

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


## BeBox BNC components

| Part name       | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|-----------------|-------|---------------|------------|---------|--------------------| 
| bnc onnector    | 5     | 1.65          | 8.25       | Digikey | A97555-ND          | 
| headphone jack  | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND     | 
| i2c io expander | 1     | 1.05          | 1.05       | Digikey | MCP23008-E/P-ND    | 
| 4.7k resistor   | 5     | 0.10          | 0.50       | Digikey | CF14JT4K70CT-ND    | 

## BeBox Button components

| Part name       | Count | Cost per part | Total cost | Vendor  | Vendor part number | 
|-----------------|-------|---------------|------------|---------|--------------------| 
| headphone jack  | 1     | 1.66          | 1.66       | Digikey | CP-435107RS-ND     | 
| i2c io expander | 1     | 1.05          | 1.05       | Digikey | MCP23008-E/P-ND    | 
| switch (cherry) | 4     | 0.90          | 3.60       | Digikey | CH310-ND           | 
| 330 resistor    | 2     | 0.10          | 0.20       | Digikey | CF14JT330RCT-ND    | 
| red led         | 1     | 0.33          | 0.33       | Digikey | 160-1853-ND        | 
| yellow led      | 1     | 0.33          | 0.33       | Digikey | 160-1851-ND        | 

## BeBox Encoder components

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
