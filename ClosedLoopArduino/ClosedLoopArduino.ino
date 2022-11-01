#include <Servo.h>

int PinA = 3;
int PinB = 4;
int PinC = 5;

char inByte = 'e';

void setup() {
  pinMode(PinA, OUTPUT); 
  digitalWrite(PinA, LOW);
  pinMode(PinB, OUTPUT); 
  digitalWrite(PinB, LOW);
  pinMode(PinC, OUTPUT); 
  digitalWrite(PinC, LOW);

  // Initialise serial connection
  Serial.begin(9600);
  Serial.println("setup");
  establishContact();
}

void loop() {
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    Serial.println(inByte);
    switch (inByte) {
      case 'e': // Empty Case
        digitalWrite(PinA, LOW);
        digitalWrite(PinB, LOW);
        digitalWrite(PinC, LOW);
        break;
      case 'g': // Grip Case
        digitalWrite(PinA, HIGH);
        digitalWrite(PinB, LOW);
        digitalWrite(PinC, LOW);
        break;
      case 'l': // Leave Case
        digitalWrite(PinA, LOW);
        digitalWrite(PinB, HIGH);
        digitalWrite(PinC, LOW);
        break;
      case 's': // Slow Case
        digitalWrite(PinA, LOW);
        digitalWrite(PinB, LOW);
        digitalWrite(PinC, HIGH);
        break;
      case 'f': // Fast Case
        digitalWrite(PinA, HIGH);
        digitalWrite(PinB, HIGH);
        digitalWrite(PinC, LOW);
        break;
      default:
        delay(5);
        break;
    }
    delay(5);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    delay(300);
  }
}
