
abstract class Button {
  float x, y, w, h;
  String label;
  boolean pressed;
  
  Button(float ix, float iy, float iw, float ih, String ilabel) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    label = ilabel;
    pressed = false; 
  }
  
  
  /*void drawButton() {
    stroke(0);
    fill(188,68,15);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // print the label
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(f,27);
    text(label, x+w/2., y+h/2.-1.); 
  }*/
  
  abstract void drawButton();
  
  
  boolean pressed() {
    float mx = mouseX;
    float my = mouseY;
    if (mx >= x && mx <= x+w && my >= y && my <= my+h && mousePressed == true) {
      this.pressed = true;
      return true;
    } 
    else {
     this.pressed = false; 
     return false;
    } 
  }
  
} 