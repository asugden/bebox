#include <Encoder.h>

#define TESTMODE 0

Encoder myEnc(2,3); // pick your pins, reverse for sign flip

void setup() {
  Serial.begin(115200);
  //SerialUSB.begin(115200); // for real-time feedback
  myEnc.write(0);
}

void loop() {
  if (TESTMODE) {
    test_serial();
  }
  else {
    run_serial();
  }
}

void run_serial() {
  long pos;
  byte *b,m;

  b = (byte *) &pos;  
  pos = myEnc.read();

  if (Serial.available()) {
    m = Serial.read();
    if(m>0) {
      myEnc.write(0);    // zero the position
      pos = 0;
    } 
    else {
      Serial.write((byte *) &pos,4);
    }
  }
}

void test_serial() {
  long pos;
  pos = myEnc.read();
  Serial.print(pos);
  Serial.println();
}
