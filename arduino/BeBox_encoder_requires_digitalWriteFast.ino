
//#include <Encoder.h>
#include <Wire.h>
#include <digitalWriteFast.h>
//Encoder myEnc(2, 3);

// Pins of the rotary encoder
#define PIN1 3
#define PIN2 2

// Pins of the output BNCs
#define FORWARDBNC 13
#define BACKWARDBNC 12

// Pulse duration
#define PULSEDUR 5

int nextPulse = 0;
bool pulsing = false;
unsigned long int pulsetime = 0;
unsigned long int now = 0;

struct EncoderData {
  long pos = 0;
  int state1last = LOW;  int state1 = LOW;
};

EncoderData enc;

void setup() {
  Serial.begin(9600);
//  Serial1.begin(9600);
//  myEnc.write(0);

  pinModeFast(PIN1, INPUT); // Top interrupter
  pinModeFast(PIN2, INPUT); // Bottom interrupter
  
  pinModeFast(FORWARDBNC, OUTPUT); // Output
  pinModeFast(BACKWARDBNC, OUTPUT); // Output
  
  digitalWriteFast(FORWARDBNC, LOW);
  digitalWriteFast(BACKWARDBNC, LOW);
  
  enc.state1last = digitalReadFast(PIN1);
}

void pulseState() {
  now = millis();
  if (pulsing && now - pulsetime > PULSEDUR) {
    digitalWriteFast(FORWARDBNC, LOW);
    digitalWriteFast(BACKWARDBNC, LOW);
    pulsetime = now;
    pulsing = false;
  }
  else if (!pulsing && nextPulse != 0 && now - pulsetime > PULSEDUR) {
    if (nextPulse > 0) {
      digitalWriteFast(FORWARDBNC, HIGH);
    }
    else {
      digitalWriteFast(BACKWARDBNC, HIGH);
    }
    
    nextPulse = 0;
    pulsetime = now;
    pulsing = true;
  }
}

int encRead() {
  enc.state1 = digitalReadFast(PIN1);
  //digitalWriteFast(13, enc.state1);
  if ((enc.state1last == LOW) && (enc.state1 == HIGH)) {
    if (digitalReadFast(PIN2) == LOW) {
      enc.pos--;
      nextPulse = -1;
    }
    else {
      enc.pos++;
      nextPulse = 1;
    }
  }
  enc.state1last = enc.state1;
  return enc.pos;
}

void loop() {
  long pos;
  byte *b,m;

  b = (byte *) &pos;  
  pos = encRead();

  Serial.println(pos);

  if (Serial.available()) {
    m = Serial.read();
    if (m > 0) {
      enc.pos = 0;
      pos = 0;
    } 
    else {
      Serial.write((byte *) &pos, 4);
    }
  }
  
  pulseState();
}



