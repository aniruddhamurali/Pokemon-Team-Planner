import g4p_controls.*;
import g4p_controls.GCScheme;
import java.awt.Font;
import java.awt.*;
GTextArea textArea;

String[] lines;
PFont f;
StringDict pokemon = new StringDict();
ArrayList<Pokemon> team = new ArrayList<Pokemon>();
String[] allTypes = {"Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", 
"Psychic", "Rock", "Steel", "Water"};

String nameInput = "";
//ShowHideButton shbutton = new ShowHideButton(


void setup() {
  size(1280,768);
  background(255);
  lines = loadStrings("PokemonList.txt");
  f = createFont("Calibri", 100);
  pokemonImages();
  typeLabelImages();
  
  for (int i = 0 ; i < lines.length; i++) {
    String[] line = lines[i].split(" ");
    
    if (line.length == 2) pokemon.set(line[0], line[1]);
    if (line.length == 3) pokemon.set(line[0], line[1] + ", " + line[2]);
  }
  megas();
  
  print(pokemon);
  textArea = new GTextArea(this, width/2 - 185, height*7/8, 370, 40, G4P.SCROLLBARS_NONE);
  //FontManager.getFont("Arial", Font.PLAIN, 30);
  //textArea.setFont(new java.awt.Font("Monospaced", Font.PLAIN, 16));  
  textArea.setText("");
}



void draw() {
  background(255);
  if (team.size() > 6) team.remove(0);
  for (int i = 0; i < team.size(); i++) {
    Pokemon p = team.get(i);
    p.nametoImage();
    p.typetoColor();
    p.typetoLabel();
    p.display((width/7)*(i+1), height/8);
  }
  displayWeaknesses();
  displayResistances();
  displayImmunities();
}



void keyPressed() {
  if (keyCode == ENTER) {
    nameInput = textArea.getText();
    if (pokemon.hasKey(nameInput) == true) team.add(new Pokemon(nameInput, pokemon.get(nameInput)));
    textArea.setText("");
  }
}



void megas() {
  pokemon.set("Mega-Venusaur", "Grass, Poison");
  pokemon.set("Mega-CharizardX", "Fire, Dragon");
  pokemon.set("Mega-CharizardY", "Fire, Flying");
  pokemon.set("Mega-Blastoise", "Water");
  pokemon.set("Mega-Beedrill", "Bug, Poison");
  pokemon.set("Mega-Pidgeot", "Normal, Flying");
}



void displayWeaknesses() {
  int[] weaknessCount = new int[18];
  for (int i = 0; i < team.size(); i++) {
    Pokemon p = team.get(i);
    ArrayList<String> weaknesses = p.weaknesses();
    for (int j = 0; j < weaknesses.size(); j++) {
      if (weaknesses.get(j).equals("Bug"))      weaknessCount[0] += 1;
      if (weaknesses.get(j).equals("Dark"))     weaknessCount[1] += 1;
      if (weaknesses.get(j).equals("Dragon"))   weaknessCount[2] += 1;
      if (weaknesses.get(j).equals("Electric")) weaknessCount[3] += 1;
      if (weaknesses.get(j).equals("Fairy"))    weaknessCount[4] += 1;
      if (weaknesses.get(j).equals("Fighting")) weaknessCount[5] += 1;
      if (weaknesses.get(j).equals("Fire"))     weaknessCount[6] += 1;
      if (weaknesses.get(j).equals("Flying"))   weaknessCount[7] += 1;
      if (weaknesses.get(j).equals("Ghost"))    weaknessCount[8] += 1;
      if (weaknesses.get(j).equals("Grass"))    weaknessCount[9] += 1;
      if (weaknesses.get(j).equals("Ground"))   weaknessCount[10] += 1;
      if (weaknesses.get(j).equals("Ice"))      weaknessCount[11] += 1;
      if (weaknesses.get(j).equals("Normal"))   weaknessCount[12] += 1;
      if (weaknesses.get(j).equals("Poison"))   weaknessCount[13] += 1;
      if (weaknesses.get(j).equals("Psychic"))  weaknessCount[14] += 1;
      if (weaknesses.get(j).equals("Rock"))     weaknessCount[15] += 1;
      if (weaknesses.get(j).equals("Steel"))    weaknessCount[16] += 1;
      if (weaknesses.get(j).equals("Water"))    weaknessCount[17] += 1;
    }
  }
  
  int bx = 50;
  int by = 370;
  color c;
  imageMode(CORNER);
  rectMode(CORNER);
  noStroke();
  textAlign(CENTER, CENTER);
  
  textSize(30);
  fill(255,0,0);
  rect(bx+25, by-75, 280, 50);
  fill(255);
  text("Weaknesses", bx+165, by-55);
  
  textSize(20);
  
  // display number of weaknesses to bug
  image(bugLabel, bx, by, 50, 18);
  if (weaknessCount[0] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[0], bx+25, by+35);
  
  image(darkLabel, bx+70, by, 50, 18);
  if (weaknessCount[1] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[1], bx+95, by+35);
  
  image(dragonLabel, bx+140, by, 50, 18);
  if (weaknessCount[2] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[2], bx+165, by+35);
  
  image(electricLabel, bx+210, by, 50, 18);
  if (weaknessCount[3] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[3], bx+235, by+35);
  
  image(fairyLabel, bx+280, by, 50, 18);
  if (weaknessCount[4] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[4], bx+305, by+35);
  
  image(fightingLabel, bx, by+70, 50, 18);
  if (weaknessCount[5] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[5], bx+25, by+105);
  
  image(fireLabel, bx+70, by+70, 50, 18);
  if (weaknessCount[6] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[6], bx+95, by+105);
  
  image(flyingLabel, bx+140, by+70, 50, 18);
  if (weaknessCount[7] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[7], bx+165, by+105);
  
  image(ghostLabel, bx+210, by+70, 50, 18);
  if (weaknessCount[8] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[8], bx+235, by+105);
  
  image(grassLabel, bx+280, by+70, 50, 18);
  if (weaknessCount[9] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[9], bx+305, by+105);
  
  image(groundLabel, bx, by+140, 50, 18);
  if (weaknessCount[10] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[10], bx+25, by+175);
  
  image(iceLabel, bx+70, by+140, 50, 18);
  if (weaknessCount[11] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[11], bx+95, by+175);
  
  image(normalLabel, bx+140, by+140, 50, 18);
  if (weaknessCount[12] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[12], bx+165, by+175);
  
  image(poisonLabel, bx+210, by+140, 50, 18);
  if (weaknessCount[13] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[13], bx+235, by+175);
  
  image(psychicLabel, bx+280, by+140, 50, 18);
  if (weaknessCount[14] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[14], bx+305, by+175);
  
  image(rockLabel, bx+70, by+210, 50, 18);
  if (weaknessCount[15] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[15], bx+95, by+245);
  
  image(steelLabel, bx+140, by+210, 50, 18);
  if (weaknessCount[16] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[16], bx+165, by+245);
  
  image(waterLabel, bx+210, by+210, 50, 18);
  if (weaknessCount[17] >= 3) c = color(255,0,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(weaknessCount[17], bx+235, by+245);
}



void displayResistances() {
  int[] resistanceCount = new int[18];
  for (int i = 0; i < team.size(); i++) {
    Pokemon p = team.get(i);
    ArrayList<String> resistances = p.resistances();
    for (int j = 0; j < resistances.size(); j++) {
      if (resistances.get(j).equals("Bug"))      resistanceCount[0] += 1;
      if (resistances.get(j).equals("Dark"))     resistanceCount[1] += 1;
      if (resistances.get(j).equals("Dragon"))   resistanceCount[2] += 1;
      if (resistances.get(j).equals("Electric")) resistanceCount[3] += 1;
      if (resistances.get(j).equals("Fairy"))    resistanceCount[4] += 1;
      if (resistances.get(j).equals("Fighting")) resistanceCount[5] += 1;
      if (resistances.get(j).equals("Fire"))     resistanceCount[6] += 1;
      if (resistances.get(j).equals("Flying"))   resistanceCount[7] += 1;
      if (resistances.get(j).equals("Ghost"))    resistanceCount[8] += 1;
      if (resistances.get(j).equals("Grass"))    resistanceCount[9] += 1;
      if (resistances.get(j).equals("Ground"))   resistanceCount[10] += 1;
      if (resistances.get(j).equals("Ice"))      resistanceCount[11] += 1;
      if (resistances.get(j).equals("Normal"))   resistanceCount[12] += 1;
      if (resistances.get(j).equals("Poison"))   resistanceCount[13] += 1;
      if (resistances.get(j).equals("Psychic"))  resistanceCount[14] += 1;
      if (resistances.get(j).equals("Rock"))     resistanceCount[15] += 1;
      if (resistances.get(j).equals("Steel"))    resistanceCount[16] += 1;
      if (resistances.get(j).equals("Water"))    resistanceCount[17] += 1;
    }
  }
  
  int bx = 475;
  int by = 370;
  color c;
  imageMode(CORNER);
  rectMode(CORNER);
  noStroke();
  textAlign(CENTER, CENTER);
  
  textSize(30);
  fill(0,255,0);
  rect(bx+25, by-75, 280, 50);
  fill(255);
  text("Resistances", bx+165, by-55);
  
  textSize(20);
  
  // display number of resistances to bug
  image(bugLabel, bx, by, 50, 18);
  if (resistanceCount[0] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[0], bx+25, by+35);
  
  image(darkLabel, bx+70, by, 50, 18);
  if (resistanceCount[1] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[1], bx+95, by+35);
  
  image(dragonLabel, bx+140, by, 50, 18);
  if (resistanceCount[2] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[2], bx+165, by+35);
  
  image(electricLabel, bx+210, by, 50, 18);
  if (resistanceCount[3] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[3], bx+235, by+35);
  
  image(fairyLabel, bx+280, by, 50, 18);
  if (resistanceCount[4] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[4], bx+305, by+35);
  
  image(fightingLabel, bx, by+70, 50, 18);
  if (resistanceCount[5] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[5], bx+25, by+105);
  
  image(fireLabel, bx+70, by+70, 50, 18);
  if (resistanceCount[6] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[6], bx+95, by+105);
  
  image(flyingLabel, bx+140, by+70, 50, 18);
  if (resistanceCount[7] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[7], bx+165, by+105);
  
  image(ghostLabel, bx+210, by+70, 50, 18);
  if (resistanceCount[8] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[8], bx+235, by+105);
  
  image(grassLabel, bx+280, by+70, 50, 18);
  if (resistanceCount[9] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[9], bx+305, by+105);
  
  image(groundLabel, bx, by+140, 50, 18);
  if (resistanceCount[10] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[10], bx+25, by+175);
  
  image(iceLabel, bx+70, by+140, 50, 18);
  if (resistanceCount[11] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[11], bx+95, by+175);
  
  image(normalLabel, bx+140, by+140, 50, 18);
  if (resistanceCount[12] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[12], bx+165, by+175);
  
  image(poisonLabel, bx+210, by+140, 50, 18);
  if (resistanceCount[13] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[13], bx+235, by+175);
  
  image(psychicLabel, bx+280, by+140, 50, 18);
  if (resistanceCount[14] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[14], bx+305, by+175);
  
  image(rockLabel, bx+70, by+210, 50, 18);
  if (resistanceCount[15] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[15], bx+95, by+245);
  
  image(steelLabel, bx+140, by+210, 50, 18);
  if (resistanceCount[16] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[16], bx+165, by+245);
  
  image(waterLabel, bx+210, by+210, 50, 18);
  if (resistanceCount[17] >= 3) c = color(0,255,0,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(resistanceCount[17], bx+235, by+245);
  
}



void displayImmunities() {
  int[] immunitiesCount = new int[18];
  for (int i = 0; i < team.size(); i++) {
    Pokemon p = team.get(i);
    ArrayList<String> immunities = p.immunities();
    for (int j = 0; j < immunities.size(); j++) {
      if (immunities.get(j).equals("Bug"))      immunitiesCount[0] += 1;
      if (immunities.get(j).equals("Dark"))     immunitiesCount[1] += 1;
      if (immunities.get(j).equals("Dragon"))   immunitiesCount[2] += 1;
      if (immunities.get(j).equals("Electric")) immunitiesCount[3] += 1;
      if (immunities.get(j).equals("Fairy"))    immunitiesCount[4] += 1;
      if (immunities.get(j).equals("Fighting")) immunitiesCount[5] += 1;
      if (immunities.get(j).equals("Fire"))     immunitiesCount[6] += 1;
      if (immunities.get(j).equals("Flying"))   immunitiesCount[7] += 1;
      if (immunities.get(j).equals("Ghost"))    immunitiesCount[8] += 1;
      if (immunities.get(j).equals("Grass"))    immunitiesCount[9] += 1;
      if (immunities.get(j).equals("Ground"))   immunitiesCount[10] += 1;
      if (immunities.get(j).equals("Ice"))      immunitiesCount[11] += 1;
      if (immunities.get(j).equals("Normal"))   immunitiesCount[12] += 1;
      if (immunities.get(j).equals("Poison"))   immunitiesCount[13] += 1;
      if (immunities.get(j).equals("Psychic"))  immunitiesCount[14] += 1;
      if (immunities.get(j).equals("Rock"))     immunitiesCount[15] += 1;
      if (immunities.get(j).equals("Steel"))    immunitiesCount[16] += 1;
      if (immunities.get(j).equals("Water"))    immunitiesCount[17] += 1;
    }
  }
  
  int bx = 900;
  int by = 370;
  color c;
  imageMode(CORNER);
  rectMode(CORNER);
  noStroke();
  textAlign(CENTER, CENTER);
  
  textSize(30);
  fill(0,0,255);
  rect(bx+25, by-75, 280, 50);
  fill(255);
  text("Immunities", bx+165, by-55);
  
  textSize(20);
  
  // display number of immunities to bug
  image(bugLabel, bx, by, 50, 18);
  if (immunitiesCount[0] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[0], bx+25, by+35);
  
  image(darkLabel, bx+70, by, 50, 18);
  if (immunitiesCount[1] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[1], bx+95, by+35);
  
  image(dragonLabel, bx+140, by, 50, 18);
  if (immunitiesCount[2] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[2], bx+165, by+35);
  
  image(electricLabel, bx+210, by, 50, 18);
  if (immunitiesCount[3] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[3], bx+235, by+35);
  
  image(fairyLabel, bx+280, by, 50, 18);
  if (immunitiesCount[4] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+20, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[4], bx+305, by+35);
  
  image(fightingLabel, bx, by+70, 50, 18);
  if (immunitiesCount[5] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[5], bx+25, by+105);
  
  image(fireLabel, bx+70, by+70, 50, 18);
  if (immunitiesCount[6] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[6], bx+95, by+105);
  
  image(flyingLabel, bx+140, by+70, 50, 18);
  if (immunitiesCount[7] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[7], bx+165, by+105);
  
  image(ghostLabel, bx+210, by+70, 50, 18);
  if (immunitiesCount[8] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[8], bx+235, by+105);
  
  image(grassLabel, bx+280, by+70, 50, 18);
  if (immunitiesCount[9] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+90, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[9], bx+305, by+105);
  
  image(groundLabel, bx, by+140, 50, 18);
  if (immunitiesCount[10] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[10], bx+25, by+175);
  
  image(iceLabel, bx+70, by+140, 50, 18);
  if (immunitiesCount[11] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[11], bx+95, by+175);
  
  image(normalLabel, bx+140, by+140, 50, 18);
  if (immunitiesCount[12] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[12], bx+165, by+175);
  
  image(poisonLabel, bx+210, by+140, 50, 18);
  if (immunitiesCount[13] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[13], bx+235, by+175);
  
  image(psychicLabel, bx+280, by+140, 50, 18);
  if (immunitiesCount[14] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+280, by+160, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[14], bx+305, by+175);
  
  image(rockLabel, bx+70, by+210, 50, 18);
  if (immunitiesCount[15] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+70, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[15], bx+95, by+245);
  
  image(steelLabel, bx+140, by+210, 50, 18);
  if (immunitiesCount[16] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+140, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[16], bx+165, by+245);
  
  image(waterLabel, bx+210, by+210, 50, 18);
  if (immunitiesCount[17] >= 1) c = color(0,0,255,100);
  else c = color(255);
  fill(c);
  rect(bx+210, by+230, 50, 40, 12, 12, 12, 12);
  fill(0);
  text(immunitiesCount[17], bx+235, by+245);
  
}


ArrayList<String> removeRedundancies(ArrayList<String> array) {
  ArrayList<String> temp = new ArrayList<String>();
  for (int i = 0; i < array.size(); i++) {
    if (temp.contains(array.get(i)) == false) {
      temp.add(array.get(i));
    }
  }
  return temp;
}