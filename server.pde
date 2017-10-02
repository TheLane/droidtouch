import netP5.*;
import oscP5.*;

import java.awt.Robot;
import java.awt.event.InputEvent;

import java.awt.MouseInfo;
import java.awt.Point;

OscP5 oscP5;

Robot robot;

Point mouse;

int mx = 1;
int my = 1;

void setup() {
  size(400, 400);
  frameRate(25);

  oscP5 = new OscP5(this, 2998);

  mouse = MouseInfo.getPointerInfo().getLocation();
}

void draw() {
  background(0);
}

void oscEvent(OscMessage theOscMessage) {
  //delay(500);
  if (theOscMessage.checkAddrPattern("mpos")==true) {
    mx += theOscMessage.get(0).intValue();
    my += theOscMessage.get(1).intValue();

    println("mx = " + mx + " : my = " + my);
  }

  try {
    robot = new Robot();
    robot.mouseMove(mouse.x + mx, mouse.y + my);
  }
  catch (Exception e) {
  }
  finally {
  }

  if (theOscMessage.checkAddrPattern("btn1")==true) {
    println("lbutton pressed");
    try {
      robot = new Robot();
      robot.mousePress(InputEvent.BUTTON1_MASK);
      robot.mouseRelease( InputEvent.BUTTON1_MASK );
    }
    catch (Exception e) {
    }
    finally {
    }
  }

  if (theOscMessage.checkAddrPattern("btn2")==true) {
    println("rbutton pressed");
    try {
      robot = new Robot();
      robot.mousePress(InputEvent.BUTTON3_MASK);
      robot.mouseRelease( InputEvent.BUTTON3_MASK );
    }
    catch (Exception e) {
    }
    finally {
    }
  }
}