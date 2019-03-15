
#include "mpr121.h"
#include <Wire.h>
#include <digitalWriteFast.h>

#define LICKMIN 60
#define DISPMIN 50
#define DEBOUNCE 50
#define LICKTIME 100
#define SOLMTIME 10
#define SOLNTIME 10
#define SOLPTIME 10

bool onLick = false;
bool onSolenoidP = false;
bool onSolenoidN = false;
bool onSolenoidM = false;
bool BsolenoidP = false;
bool BsolenoidN = false;
bool BsolenoidM = false;

boolean touchStates[12];  // to keep track of the previous touch states

unsigned long int TonLick = 0;
unsigned long int TonSolenoidP = 0;
unsigned long int TonSolenoidN = 0;
unsigned long int TonSolenoidM = 0;
unsigned long int now;

/* PINS:
3 Solenoid left (from back)/ right (from front)/yellow/plus
4 Solenoid middle/black/neutral
5 Solenoid right (from back)/ left (from front)/red/minus
8 Lick TTL
10 red button/minus
11 black button/neutral
12 yellow button/plus
14 TTL right (from back)/red/minus
15 TTL middle/black/neutral
16 TTL left/yellow/plus
17 Lick LED
*/

void setup() {
  pinModeFast(3, OUTPUT);
  pinModeFast(4, OUTPUT);
  pinModeFast(5, OUTPUT);
  pinModeFast(8, OUTPUT);
  
  pinModeFast(10, INPUT);
  digitalWrite(10, HIGH);  // equivalent to INPUT_PULLUP
  pinModeFast(11, INPUT);
  digitalWrite(11, HIGH);  // equivalent to INPUT_PULLUP
  pinModeFast(12, INPUT);
  digitalWrite(12, HIGH);  // equivalent to INPUT_PULLUP
  
  pinModeFast(14, INPUT);
  pinModeFast(15, INPUT);
  pinModeFast(16, INPUT);
  pinModeFast(17, OUTPUT);
  
  Wire.begin();
  mpr121_setup();
  
//  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  now = millis();
  checkLick();
  checkSolenoids();
}


bool readTouchInputs(){
  //read the touch state from the MPR121
  bool out = false;
  
  Wire.requestFrom(0x5A,2); 
  byte LSB = Wire.read();
  byte MSB = Wire.read();
  uint16_t touched = ((MSB << 8) | LSB); //16bits that make up the touch states

  for (int i = 0; i < 12; i++) {  // Check what electrodes were pressed
    if(touched & (1<<i)){
    
      if(touchStates[i] == 0){
        out = true;
      
      }
    
      touchStates[i] = 1;      
    }
    else{
      
      touchStates[i] = 0;
    }
  }
  
  return out;
}

// Check for a lick, if found, pass on to TTL and LED
void checkLick() {
  bool i2click = readTouchInputs();
  if (onLick && now - TonLick > LICKTIME) {
    onLick = false;
    TonLick = now;
    digitalWriteFast(8, false);
    digitalWriteFast(17, false);
  }
  
  else if (!onLick && i2click == HIGH && now - TonLick > LICKTIME/5) {
    onLick = true;
    TonLick = now;
    digitalWriteFast(8, true);
    digitalWriteFast(17, true);    
  }
}

// Check whether the solenoids should be turned on or off, then turn them on or off
// This function forces only one solenoid to be on at a time
void checkSolenoids() {
  if (onSolenoidP && now - TonSolenoidP > SOLPTIME && digitalReadFast(16) == LOW && digitalReadFast(12) == HIGH) {
    onSolenoidP = false;
    digitalWriteFast(3, false);
  }
  else if (onSolenoidM && now - TonSolenoidM > SOLMTIME && digitalReadFast(14) == LOW && digitalReadFast(10) == HIGH) {
    onSolenoidM = false;
    digitalWriteFast(5, false);
  }
  else if (onSolenoidN && now - TonSolenoidN > SOLNTIME && digitalReadFast(15) == LOW && digitalReadFast(11) == HIGH) {
    onSolenoidN = false;
    digitalWriteFast(4, false);
  }
  
  else if (!onSolenoidP && !onSolenoidM && !onSolenoidN && (digitalReadFast(16) == HIGH || digitalReadFast(12) == LOW)) {
    onSolenoidP = true;
    digitalWriteFast(3, true);
    TonSolenoidP = now;
  }
  else if (!onSolenoidP && !onSolenoidM && !onSolenoidN && (digitalReadFast(14) == HIGH || digitalReadFast(10) == LOW)) {
    onSolenoidM = true;
    digitalWriteFast(5, true);
    TonSolenoidM = now;
  }
  else if (!onSolenoidP && !onSolenoidM && !onSolenoidN && (digitalReadFast(15) == HIGH || digitalReadFast(11) == LOW)) {
    onSolenoidN = true;
    digitalWriteFast(4, true);
    TonSolenoidN = now;
  }
}


void mpr121_setup(void){

  set_register(0x5A, ELE_CFG, 0x00); 
  
  // Section A - Controls filtering when data is > baseline.
  set_register(0x5A, MHD_R, 0x01);
  set_register(0x5A, NHD_R, 0x01);
  set_register(0x5A, NCL_R, 0x00);
  set_register(0x5A, FDL_R, 0x00);

  // Section B - Controls filtering when data is < baseline.
  set_register(0x5A, MHD_F, 0x01);
  set_register(0x5A, NHD_F, 0x01);
  set_register(0x5A, NCL_F, 0xFF);
  set_register(0x5A, FDL_F, 0x02);
  
  // Section C - Sets touch and release thresholds for each electrode
  set_register(0x5A, ELE0_T, TOU_THRESH);
  set_register(0x5A, ELE0_R, REL_THRESH);
 
  set_register(0x5A, ELE1_T, TOU_THRESH);
  set_register(0x5A, ELE1_R, REL_THRESH);
  
  set_register(0x5A, ELE2_T, TOU_THRESH);
  set_register(0x5A, ELE2_R, REL_THRESH);
  
  set_register(0x5A, ELE3_T, TOU_THRESH);
  set_register(0x5A, ELE3_R, REL_THRESH);
  
  set_register(0x5A, ELE4_T, TOU_THRESH);
  set_register(0x5A, ELE4_R, REL_THRESH);
  
  set_register(0x5A, ELE5_T, TOU_THRESH);
  set_register(0x5A, ELE5_R, REL_THRESH);
  
  set_register(0x5A, ELE6_T, TOU_THRESH);
  set_register(0x5A, ELE6_R, REL_THRESH);
  
  set_register(0x5A, ELE7_T, TOU_THRESH);
  set_register(0x5A, ELE7_R, REL_THRESH);
  
  set_register(0x5A, ELE8_T, TOU_THRESH);
  set_register(0x5A, ELE8_R, REL_THRESH);
  
  set_register(0x5A, ELE9_T, TOU_THRESH);
  set_register(0x5A, ELE9_R, REL_THRESH);
  
  set_register(0x5A, ELE10_T, TOU_THRESH);
  set_register(0x5A, ELE10_R, REL_THRESH);
  
  set_register(0x5A, ELE11_T, TOU_THRESH);
  set_register(0x5A, ELE11_R, REL_THRESH);
  
  // Section D
  // Set the Filter Configuration
  // Set ESI2
  set_register(0x5A, FIL_CFG, 0x04);
  
  // Section E
  // Electrode Configuration
  // Set ELE_CFG to 0x00 to return to standby mode
  set_register(0x5A, ELE_CFG, 0x0C);  // Enables all 12 Electrodes
  
  
  // Section F
  // Enable Auto Config and auto Reconfig
  /*set_register(0x5A, ATO_CFG0, 0x0B);
  set_register(0x5A, ATO_CFGU, 0xC9);  // USL = (Vdd-0.7)/vdd*256 = 0xC9 @3.3V   set_register(0x5A, ATO_CFGL, 0x82);  // LSL = 0.65*USL = 0x82 @3.3V
  set_register(0x5A, ATO_CFGT, 0xB5);*/  // Target = 0.9*USL = 0xB5 @3.3V
  
  set_register(0x5A, ELE_CFG, 0x0C);
  
}

void set_register(int address, unsigned char r, unsigned char v){
    Wire.beginTransmission(address);
    Wire.write(r);
    Wire.write(v);
    Wire.endTransmission();
}
