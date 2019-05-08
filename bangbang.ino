#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_MS_PWMServoDriver.h"

Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 
Adafruit_DCMotor *myMotor = AFMS.getMotor(2);
int sensorPin = A1;    // select the input pin for the potentiometer
int sensorValue = 0;  // variable to store the value coming from the sensor
int spd = 255; // Speed of motor
String readString; //String captured from serial port

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Adafruit Motorshield v2 - DC Motor test!");

  AFMS.begin();  // create with the default frequency 1.6KHz
  //AFMS.begin(1000);  // OR with a different frequency, say 1KHz
  
  // Set the speed to start, from 0 (off) to 255 (max speed)
  myMotor->setSpeed(spd);
}

void loop() { 
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);
  if (sensorValue < 645) {
    myMotor->run(BACKWARD);
  } else if (sensorValue > 665) {
    myMotor->run(RELEASE);
  }
//  Serial.println(sensorValue);
//  while (Serial.available()) {
//    char c = Serial.read();  //gets one byte from serial buffer
//    readString += c; //makes the string readString
//    delay(2);  //slow looping to allow buffer to fill with next character
//  }
}
