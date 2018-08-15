
class Search {
  float x, y, w, h;
  boolean pressed;
  boolean clicked;
  String pokemonString;
  
  Search() {
    x = 450;
    y = 550;
    w = 400;
    h = 50;
    pressed = false;
    clicked = false;
    pokemonString = "";
  }  
  
  void display() {
    rectMode(CENTER);
    stroke(255);
    fill(0);
    rect(x, y, w, h);
  }
  
  
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
  
  void search() {
    if (pressed() == true) {
      if (clicked == false) clicked = true; 
      else if (clicked == true) clicked = false;
      println(clicked);
    }
    
    if (keyPressed && clicked == true) {
      if (key == 'a') pokemonString += "a"; 
    }
    fill(255);
    textFont(f, 36);
    textAlign(LEFT, CENTER);
    text("pokemonString", 260, 545);
  }
}