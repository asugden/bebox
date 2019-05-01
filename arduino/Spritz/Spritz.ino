// Necessary for the encoder to read the interrupt pins
#define ENCODER_USE_INTERRUPTS
#define __SAMD51__ 1
//#define CORE_NUM_INTERRUPT 20
//#define CORE_INT2_PIN 2
//#define CORE_INT3_PIN 3

#include <SPI.h>
#include "Wire.h"
#include "Encoder.h"
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "Montserrat_Medium20pt7b.h"
#include "Montserrat_Regular6pt7b.h"

// Settings
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Pins
// Reference https://github.com/adafruit/ArduinoCore-samd/blob/master/variants/itsybitsy_m4/variant.h
#define OLED_MOSI  PIN_SPI_MOSI  // Maybe should switch to hardware PIN_SPI_MOSI
#define OLED_CLK   PIN_SPI_SCK   // Maybe should switch to hardware PIN_SPI_SCK
#define OLED_DC    PIN_A3
#define OLED_CS    PIN_A5
#define OLED_RESET PIN_A4

#define ENCODER1    9
#define ENCODER2    10
#define ENCODER_BUT 7
#define TOP_BUT     11
#define BOT_BUT     12
#define LED_PIN     4
#define OUT_PIN     3

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT,
  OLED_MOSI, OLED_CLK, OLED_DC, OLED_RESET, OLED_CS);
Encoder encoder(ENCODER1, ENCODER2);

long encoder_pos = 0;
float pulse_ms = 5.0;
float pulse_sec = 0.5;
bool pulsing = false;
bool active_output = false;
int mode = 0;

unsigned long int now;
unsigned long int now_micro;
unsigned long int pulse_start;
unsigned long int mode_last = 0;
unsigned long int pulsing_last = 0;

bool drawNext = false;

void setup() {
  Serial.begin(9600);

  if(!display.begin(SSD1306_SWITCHCAPVCC)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  
  encoder_pos = encoder.read();
  
  pinMode(ENCODER_BUT, INPUT_PULLUP);
  pinMode(TOP_BUT, INPUT_PULLUP);
  pinMode(BOT_BUT, INPUT_PULLUP);
  pinMode(LED_PIN, OUTPUT);
  pinMode(OUT_PIN, OUTPUT);

  attachInterrupt(digitalPinToInterrupt(TOP_BUT), interruptMode, FALLING);
  attachInterrupt(digitalPinToInterrupt(BOT_BUT), interruptPulse, FALLING);

  // Clear the buffer
  display.setTextColor(WHITE);        // Draw white text
  display.clearDisplay();
  
  drawDispense();
}

void loop() {
  now = millis();
  updateEncoder();
  calculateStim();

  if (drawNext) {
    drawDispense();
    drawNext = false;
  }
}

void interruptMode() {
  if (now - mode_last > 400) {
    mode = (mode + 1)%2;
    mode_last = now;
  }
  
  drawNext = true;
}

void updateEncoder() {
  int delta;
  long pos;
  
  pos = encoder.read();
  if (abs(pos - encoder_pos) > 3 && mode == 0) {
    delta = (pos - encoder_pos)/4;

    if (pulse_ms < 10 || (pulse_ms == 10 && delta < 0)) {
      pulse_ms += float(delta)/2;
    }
    else if (pulse_ms < 20 || (pulse_ms == 20 && delta < 0)) {
      pulse_ms += delta;
      pulse_ms = round(pulse_ms);
    }
    else if (pulse_ms < 50 || (pulse_ms == 50 && delta < 0)) {
      pulse_ms += delta*2;
    }
    else if (pulse_ms < 100 || (pulse_ms == 100 && delta < 0)) {
      pulse_ms += delta*5;
    }
    else {
      pulse_ms += delta*50;
    }

    if (pulse_ms < 0.5) {
      pulse_ms = 0.5;
    }
    else if (pulse_ms > 500) {
      pulse_ms = 500;
    }

    drawDispense();
    encoder_pos = pos;
  }
  
  else if (abs(pos - encoder_pos) > 3 && mode == 1) {
    delta = (pos - encoder_pos)/4;

    if (pulse_sec < 2.0 || (pulse_sec == 2.0 && delta < 0)) {
      pulse_sec += float(delta)/10;
    }
    else {
       pulse_sec += float(delta)/5;
    }

    if (pulse_sec < 0.1) {
      pulse_sec = 0.1;
    }
    else if (pulse_sec > 20) {
      pulse_sec = 20;
    }

    drawDispense();
    encoder_pos = pos;
  }
}

// DRAWING
// ---------------------------------------------------------------
void drawDispense() {
  display.clearDisplay();
  
  // Dispensing code
  if (pulsing) {
    display.fillRect(0, 0, 2, display.height(), WHITE);
  }

  // Main draw code
  // BIG
  display.setFont(&Montserrat_Medium20pt7b);
  display.setCursor(20, 60);

  if (mode == 0) {
    display.print(pulse_ms, pulse_ms < 10 ? 1 : 0);
  }
  else {
    display.print(pulse_sec, pulse_sec < 10 ? 1 : 0);
  }

  // Small fonts
  display.setFont(&Montserrat_Regular6pt7b);
  
  display.setCursor(110, 60);
  if (mode == 0) {display.print("ms");}
  else {display.print("/s");}

  // Mode code
  display.setCursor(10, 16);
  if (mode == 0) {display.print("PUFF");}
  else {display.print("RATE");}

  // Mode code
  display.setCursor(80, 16);
  if (mode == 0) {
    display.print(pulse_sec, pulse_sec < 10 ? 1 : 0);
    display.setCursor(110, 16);
    display.print("/s");
  }
  else {
    display.print(pulse_ms, pulse_ms < 10 ? 1 : 0);
    display.setCursor(110, 16);
    display.print("ms");
  }
  
  display.display();
}


void interruptPulse() {
  if (now - pulsing_last > 400) {
    if (!pulsing) {
      pulsing = true;
      pulse_start = micros();
    }
    else if (!digitalRead(BOT_BUT) && pulsing) {
      pulsing = false;
    }
    
    pulsing_last = now;
    drawNext = true;
  }
}

// Calculate and apply optogenetic stimulus
void calculateStim() {
  if (pulsing) {
    bool tmpoutput = false;
    now_micro = micros();
    unsigned long int currenttime = now_micro - pulse_start;
    
    // If during the on section of the repeat
    float window = pulse_sec*1000000.0;
    //float window = 1000000.0/pars.frequencyHz;
    if (fmod((float) currenttime, window) < pulse_ms*1000.0) {
      tmpoutput = true;
    }
    
    // Write the output
    if (tmpoutput && !active_output) {
      digitalWrite(OUT_PIN, HIGH);
      digitalWrite(LED_PIN, HIGH);
      pulse_start = now_micro;
      active_output = true;
    }
    else if (!tmpoutput && active_output) {
      digitalWrite(OUT_PIN, LOW);
      digitalWrite(LED_PIN, LOW);
      active_output = false;
    }
  }
  else {
    digitalWrite(OUT_PIN, LOW);
    digitalWrite(LED_PIN, LOW);
  }
}
