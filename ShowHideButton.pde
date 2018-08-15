
class ShowHideButton extends Button {
  float x, y, w, h;
  String label;
  
  ShowHideButton(float ix, float iy, float iw, float ih, String ilabel) {
    super(ix, iy, iw, ih, ilabel); 
  }
  
  void drawButton() {
    stroke(0);
    fill(188,68,15);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // print the label
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(f,20);
    text(label, x+w/2., y+h/2.-1.); 
  }
  
}