#include <Wire.h>
#include "Adafruit_MCP23008.h"
#include "mpr121.h"

#define LICK_MIN_MS 60
#define SOLENOID_MIN_MS 20

bool active_but[4] = {false, false, false, false};  // Which buttons are active
bool active_bnc[4] = {false, false, false, false};  // Which BNCs are active
int solenoid_on = -1;  // There can only be one solenoid on at a time
unsigned long int solenoid_change = 0;  // The solenoids can only change every N ms

bool touchStates[12];  // to keep track of the previous touch states
int active_lick = -1;  // Which lick option is selected
int lick_ttl_on = -1;
unsigned long int last_lick = 0;  // The time of the last lick
unsigned long int last_lick_ttl = 0;  // The time of the last lick
bool lick_change = false;

unsigned long int now = 0;

Adafruit_MCP23008 bebox_but;
Adafruit_MCP23008 bebox_bnc;

void setup() {
  // Initialize the BNC sub-box
  bebox_bnc.begin(0);
  for (int i = 1; i < 5; i++) {
    bebox_bnc.pinMode(i, INPUT);
  }
  bebox_bnc.pinMode(0, OUTPUT);  // lick  
  
  // Initialize the button sub-box
  bebox_but.begin(1);
  for (int i = 0; i < 4; i++) {
    bebox_but.pinMode(i, INPUT);
    bebox_but.pullUp(i, HIGH);  // turn on a 100K pullup internally
  }
  bebox_but.pinMode(4, OUTPUT);  // red LED
  bebox_but.pinMode(5, OUTPUT);  // yellow LED

  // Initialize the solenoid outputs
  for (int i = 3; i < 7; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }

  // Initialize the lick detection
  Wire.begin();
  mpr121_setup();
}

void loop() {
  now = millis();
  checkBNCs();
  checkButtons();
  setSolenoids();
  
  checkLicks();
  if (lick_change) {
    setLicks();
    lick_change = false;
  }
}

// Check which BNCs are currently on
void checkBNCs() {
  int mcpio = bebox_bnc.readGPIO();
  for (int i = 1; i < 5; i++) {
    active_bnc[i-1] = ((mcpio >> i) & 0x1);
  }
}

// Check which buttons are currently on
void checkButtons() {
  int mcpio = bebox_but.readGPIO();
  for (int i = 0; i < 4; i++) {
    active_but[i] = !((mcpio >> i) & 0x1);
  }
}

// Set which solenoid is active
void setSolenoids() {
  if (now - solenoid_change > SOLENOID_MIN_MS) {
    if (solenoid_on > -1 and !active_bnc[solenoid_on] and !active_but[solenoid_on]) {
      digitalWrite(6 - solenoid_on, LOW);
      solenoid_on = -1;
      solenoid_change = now;
    }
    else {
      int i = 0;
      while (solenoid_on < 0 && i < 4) {
        if (active_bnc[i] || active_but[i]) {
          solenoid_on = i;
          digitalWrite(6 - solenoid_on, HIGH);
          solenoid_change = now;
        }
        i++;
      }
    }
  }
}

// Check for a lick, if found, pass on to TTL and LED
void checkLicks() {
  if (now - last_lick > LICK_MIN_MS) {
    //read the touch state from the MPR121
    Wire.requestFrom(0x5A,2); 
    byte LSB = Wire.read();
    byte MSB = Wire.read();
    uint16_t touched = ((MSB << 8) | LSB); //16bits that make up the touch states

    bool licks_found[2] = {false, false};
    for (int j = 0; j < 2; j++) {
      for (int i = j*6+0; i < j*6+6; i++) {  // Check what electrodes were pressed
        if (touched & (1 << i) && !touchStates[i]) {
          licks_found[j] = true;
        }
        
        touchStates[i] = touched & (1 << i);
      }
    }

    if (active_lick > -1 && !licks_found[active_lick]) {
      active_lick = -1;
      last_lick = now;
      lick_change = true;
    }
    else if (active_lick == -1) {
      for (int j = 1; j >= 0; j--) {
        if (licks_found[j]) {
          active_lick = j;
          last_lick = now;
          lick_change = true;
        }
      }
    }
  }
}

// Set the LED and TTL for licking
void setLicks() {
  bebox_bnc.digitalWrite(0, LOW);
  bebox_but.digitalWrite(4, LOW);
  bebox_but.digitalWrite(5, LOW);
  
  if (active_lick == 0) {
    bebox_bnc.digitalWrite(0, HIGH);
    bebox_but.digitalWrite(4, HIGH);
  }
  else if (active_lick == 1) {
    bebox_bnc.digitalWrite(0, HIGH);
    bebox_but.digitalWrite(5, HIGH);
  }
}

// ==============================================================
// The following us only for setting up the lick detector
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
