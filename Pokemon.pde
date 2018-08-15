
class Pokemon {
  String name;
  String[] types = {};
  PImage img;
  PImage label1, label2;
  int w, h; // designated width and height of pokemon image
  int lw, lh; // width and height of labelImage
  int d; // diameter of circle
  color fillColor;
  color strokeColor;
  
  Pokemon (String iname, String itypes) {
    name = iname;
    if (itypes.contains(",") == true) types = itypes.split(", ");
    else types = append(types, itypes);
    
    d = 145;
    lw = 50;
    lh = 18;
  }
  
  
  void display(int x, int y) {
    noStroke();
    fill(strokeColor);
    ellipse(x, y, d+10, d+10);
    fill(fillColor);
    ellipse(x, y, d, d);
    imageMode(CENTER);
    image(img, x, y, w, h);
    rectMode(CENTER);
    rect(x, y+d-30, d, d/3, 12, 12, 12, 12);
    if (types.length == 2) {
      image(label1, x-(d)/4+10, y+d-30, lw, lh);
      image(label2, x+(d)/4-10, y+d-30, lw, lh);
    }
    else image(label1, x, y+d-30, lw, lh);
  }
  
  
  ArrayList<String> weaknesses() {
    ArrayList<String> weaknesses = new ArrayList<String>();
    for (int i = 0; i < allTypes.length; i++) {
      for (int j = 0; j < types.length; j++) {
        if (determineImmunities(types[j], allTypes[i]) == true) weaknesses.remove(allTypes[i]);
        if (determineWeakness(types[j], allTypes[i]) == true) weaknesses.add(allTypes[i]);
        if (j == 1 && determineWeakness(types[j], allTypes[i]) == true && determineResistance(types[0], allTypes[i]) == true) weaknesses.remove(allTypes[i]);
        if (j == 1 && determineResistance(types[j], allTypes[i]) == true) weaknesses.remove(allTypes[i]);
      }
    }
    weaknesses = removeRedundancies(weaknesses);
    return weaknesses;
  }
  
  
  ArrayList<String> resistances() {
    ArrayList<String> resistances = new ArrayList<String>();
    for (int i = 0; i < allTypes.length; i++) {
      for (int j = 0; j < types.length; j++) {
        if (determineImmunities(types[j], allTypes[i]) == true) resistances.remove(allTypes[i]);
        if (determineResistance(types[j], allTypes[i]) == true) resistances.add(allTypes[i]);
        if (j == 1 && determineWeakness(types[j], allTypes[i]) == true && determineResistance(types[0], allTypes[i]) == true) resistances.remove(allTypes[i]);
        if (j == 1 && determineWeakness(types[j], allTypes[i]) == true) resistances.remove(allTypes[i]);
      }
    }
    resistances = removeRedundancies(resistances);
    return resistances;
  }
  
  
  ArrayList<String> immunities() {
    ArrayList<String> immunities = new ArrayList<String>();
    for (int i = 0; i < allTypes.length; i++) {
      for (int j = 0; j < types.length; j++) {
        if (determineImmunities(types[j], allTypes[i]) == true) immunities.add(allTypes[i]);
      }
    }
    immunities = removeRedundancies(immunities);
    return immunities;
  }
  
  
  
  //otherType acts on mainType
  boolean determineImmunities(String mainType, String otherType) {
    if (mainType.equals("Normal") && otherType.equals("Ghost")) return true;
    if (mainType.equals("Ghost") && otherType.equals("Normal")) return true;
    if (mainType.equals("Ghost") && otherType.equals("Fighting")) return true;
    if (mainType.equals("Dark") && otherType.equals("Psychic")) return true;
    if (mainType.equals("Flying") && otherType.equals("Ground")) return true;
    if (mainType.equals("Fairy") && otherType.equals("Dragon")) return true;
    if (mainType.equals("Ground") && otherType.equals("Electric")) return true;
    if (mainType.equals("Steel") && otherType.equals("Poison")) return true;
    return false;
  }
  
  
  // otherType acts on mainType
  boolean determineWeakness(String mainType, String otherType) {
    if (mainType.equals("Grass") && (otherType.equals("Fire") || otherType.equals("Bug") || otherType.equals("Ice") || otherType.equals("Poison") || otherType.equals("Flying"))) return true;
    if (mainType.equals("Fire") && (otherType.equals("Water") || otherType.equals("Rock") || otherType.equals("Ground"))) return true;
    if (mainType.equals("Water") && (otherType.equals("Grass") || otherType.equals("Electric"))) return true;
    if (mainType.equals("Bug") && (otherType.equals("Fire") || otherType.equals("Flying") || otherType.equals("Rock"))) return true;
    if (mainType.equals("Dark") && (otherType.equals("Fighting") || otherType.equals("Fairy") || otherType.equals("Bug"))) return true;
    if (mainType.equals("Dragon") && (otherType.equals("Dragon") || otherType.equals("Ice"))) return true;
    if (mainType.equals("Electric") && (otherType.equals("Ground"))) return true;
    if (mainType.equals("Fairy") && (otherType.equals("Steel") || otherType.equals("Poison"))) return true;
    if (mainType.equals("Fighting") && (otherType.equals("Flying") || otherType.equals("Psychic"))) return true;
    if (mainType.equals("Flying") && (otherType.equals("Electric") || otherType.equals("Rock") || otherType.equals("Ice"))) return true;
    if (mainType.equals("Ghost") && (otherType.equals("Dark") || otherType.equals("Ghost"))) return true;
    if (mainType.equals("Ground") && (otherType.equals("Water") || otherType.equals("Grass") || otherType.equals("Ice"))) return true;
    if (mainType.equals("Ice") && (otherType.equals("Fire") || otherType.equals("Steel") || otherType.equals("Rock") || otherType.equals("Fighting"))) return true;
    if (mainType.equals("Normal") && (otherType.equals("Fighting"))) return true;
    if (mainType.equals("Poison") && (otherType.equals("Psychic") || otherType.equals("Ground"))) return true;
    if (mainType.equals("Psychic") && (otherType.equals("Dark") || otherType.equals("Bug"))) return true;
    if (mainType.equals("Rock") && (otherType.equals("Grass") || otherType.equals("Water") || otherType.equals("Fighting") || otherType.equals("Steel") || otherType.equals("Ground"))) return true;
    if (mainType.equals("Steel") && (otherType.equals("Fire") || otherType.equals("Ground") || otherType.equals("Fighting"))) return true;
    return false;
  }
  
  
  // otherType acts on mainType
  boolean determineResistance(String mainType, String otherType) {
    if (mainType.equals("Grass") && (otherType.equals("Grass") || otherType.equals("Ground") || otherType.equals("Water") || otherType.equals("Electric"))) return true;
    if (mainType.equals("Fire") && (otherType.equals("Fire") || otherType.equals("Grass") || otherType.equals("Bug") || otherType.equals("Fairy") || otherType.equals("Ice") || 
    otherType.equals("Steel"))) return true;
    if (mainType.equals("Water") && (otherType.equals("Fire") || otherType.equals("Water") || otherType.equals("Ice") || otherType.equals("Steel"))) return true;
    if (mainType.equals("Bug") && (otherType.equals("Grass") || otherType.equals("Fighting") || otherType.equals("Ground"))) return true;
    if (mainType.equals("Dark") && (otherType.equals("Ghost") || otherType.equals("Dark"))) return true;
    if (mainType.equals("Dragon") && (otherType.equals("Fire") || otherType.equals("Water") || otherType.equals("Grass") || otherType.equals("Electric"))) return true;
    if (mainType.equals("Electric") && (otherType.equals("Flying") || otherType.equals("Steel") || otherType.equals("Electric"))) return true;
    if (mainType.equals("Fairy") && (otherType.equals("Fighting") || otherType.equals("Bug") || otherType.equals("Dark"))) return true;
    if (mainType.equals("Fighting") && (otherType.equals("Rock") || otherType.equals("Bug") || otherType.equals("Dark"))) return true;
    if (mainType.equals("Flying") && (otherType.equals("Fighting") || otherType.equals("Bug") || otherType.equals("Grass"))) return true;
    if (mainType.equals("Ghost") && (otherType.equals("Poison") || otherType.equals("Bug"))) return true;
    if (mainType.equals("Ground") && (otherType.equals("Poison") || otherType.equals("Rock"))) return true;
    if (mainType.equals("Ice") && (otherType.equals("Ice"))) return true;
    //if (mainType.equals("Normal") && (otherType.equals("Fighting"))) return true;
    if (mainType.equals("Poison") && (otherType.equals("Fighting") || otherType.equals("Poison") || otherType.equals("Bug") || otherType.equals("Fairy"))) return true;
    if (mainType.equals("Psychic") && (otherType.equals("Fighting") || otherType.equals("Psychic"))) return true;
    if (mainType.equals("Rock") && (otherType.equals("Normal") || otherType.equals("Flying") || otherType.equals("Poison") || otherType.equals("Fire"))) return true;
    if (mainType.equals("Steel") && (otherType.equals("Normal") || otherType.equals("Flying") || otherType.equals("Rock") || otherType.equals("Bug") || otherType.equals("Steel") || 
    otherType.equals("Grass") || otherType.equals("Psychic") || otherType.equals("Ice") || otherType.equals("Dragon") || otherType.equals("Fairy"))) return true;
    return false;
  }
  
  
  void nametoImage() {
    if (name.equals("Bulbasaur") == true) { img = bulbasaur; w = 48; h = 45; }
    if (name.equals("Ivysaur") == true) { img = ivysaur; w = 78; h = 66; }
    if (name.equals("Venusaur") == true) { img = venusaur; w = 101; h = 75; }
    if (name.equals("Mega-Venusaur") == true) { img = mega_venusaur; w = 126; h = 89; }
    if (name.equals("Charmander") == true) { img = charmander; w = 44; h = 61; }
    if (name.equals("Charmeleon") == true) { img = charmeleon; w = 48; h = 68; }
    if (name.equals("Charizard") == true) { img = charizard; w = 97; h = 95; }
    if (name.equals("Mega-CharizardX") == true) { img = mega_charizardX; w = 114; h = 94; }
    if (name.equals("Mega-CharizardY") == true) { img = mega_charizardY; w = 110; h = 95; }
    if (name.equals("Squirtle") == true) { img = squirtle; w = 55; h = 57; }
    if (name.equals("Wartortle") == true) { img = wartortle; w = 59; h = 74; }
    if (name.equals("Blastoise") == true) { img = blastoise; w = 87; h = 86; }
    if (name.equals("Mega-Blastoise") == true) { img = mega_blastoise; w = 113; h = 110; }
    if (name.equals("Caterpie") == true) { img = caterpie; w = 46; h = 46; }
    if (name.equals("Metapod") == true) { img = metapod; w = 43; h = 56; }
    if (name.equals("Butterfree") == true) { img = butterfree; w = 74; h = 83; }
    if (name.equals("Weedle") == true) { img = weedle; w = 29; h = 51; }
    if (name.equals("Kakuna") == true) { img = kakuna; w = 31; h = 70; }
    if (name.equals("Beedrill") == true) { img = beedrill; w = 81; h = 85; }
    if (name.equals("Mega-Beedrill") == true) { img = mega_beedrill; w = 92; h = 89; }
    if (name.equals("Pidgey") == true) { img = pidgey; w = 37; h = 51; }
    if (name.equals("Pidgeotto") == true) { img = pidgeotto; w = 90; h = 56; }
    if (name.equals("Pidgeot") == true) { img = pidgeot; w = 88; h = 96; }
    if (name.equals("Mega-Pidgeot") == true) { img = mega_pidgeot; w = 120; h = 94; }
  }
  
  
  void typetoColor() {
    // fill color
    if (types[0].equals("Grass") == true)    { fillColor = color(120,200,80);  }
    if (types[0].equals("Fire") == true)     { fillColor = color(240,128,48);  }
    if (types[0].equals("Water") == true)    { fillColor = color(104,144,240); }
    if (types[0].equals("Poison") == true)   { fillColor = color(160,64,160);  }
    if (types[0].equals("Bug") == true)      { fillColor = color(168,184,32);  }
    if (types[0].equals("Flying") == true)   { fillColor = color(168,144,240); }
    if (types[0].equals("Normal") == true)   { fillColor = color(168,168,120); }
    if (types[0].equals("Dark") == true)     { fillColor = color(112,88,72);   }
    if (types[0].equals("Dragon") == true)   { fillColor = color(112,56,248);  }
    if (types[0].equals("Electric") == true) { fillColor = color(248,208,48);  }
    if (types[0].equals("Fairy") == true)    { fillColor = color(238,153,172); }
    if (types[0].equals("Fighting") == true) { fillColor = color(192,48,40);   }
    if (types[0].equals("Ghost") == true)    { fillColor = color(112,88,152);  }
    if (types[0].equals("Ground") == true)   { fillColor = color(224,192,104); }
    if (types[0].equals("Ice") == true)      { fillColor = color(152,216,216); }
    if (types[0].equals("Psychic") == true)  { fillColor = color(248,88,136);  }
    if (types[0].equals("Rock") == true)     { fillColor = color(184,160,56);  }
    if (types[0].equals("Steel") == true)    { fillColor = color(184,184,208); }
    
    //stroke color for pokemon with two types
    if (types.length == 2) {
      if (types[1].equals("Grass") == true)    { strokeColor = color(78,130,52);   }
      if (types[1].equals("Fire") == true)     { strokeColor = color(156,83,31);   }
      if (types[1].equals("Water") == true)    { strokeColor = color(68,94,156);   }
      if (types[1].equals("Poison") == true)   { strokeColor = color(104,42,104);  }
      if (types[1].equals("Bug") == true)      { strokeColor = color(109,120,21);  }
      if (types[1].equals("Flying") == true)   { strokeColor = color(109,94,156);  }
      if (types[1].equals("Normal") == true)   { strokeColor = color(109,109,78);  }
      if (types[1].equals("Dark") == true)     { strokeColor = color(73,57,47);    }
      if (types[1].equals("Dragon") == true)   { strokeColor = color(73,36,161);   }
      if (types[1].equals("Electric") == true) { strokeColor = color(161,135,31);  }
      if (types[1].equals("Fairy") == true)    { strokeColor = color(155,100,112); }
      if (types[1].equals("Fighting") == true) { strokeColor = color(125,31,26);   }
      if (types[1].equals("Ghost") == true)    { strokeColor = color(73,57,99);    }
      if (types[1].equals("Ground") == true)   { strokeColor = color(146,125,68);  }
      if (types[1].equals("Ice") == true)      { strokeColor = color(99,141,141);  }
      if (types[1].equals("Psychic") == true)  { strokeColor = color(161,57,89);   }
      if (types[1].equals("Rock") == true)     { strokeColor = color(120,104,36);  }
      if (types[1].equals("Steel") == true)    { strokeColor = color(120,120,135); }
    }
    // stroke color for pokemon with only one type
    else {
      if (types[0].equals("Grass") == true)    { strokeColor = color(78,130,52);   }
      if (types[0].equals("Fire") == true)     { strokeColor = color(156,83,31);   }
      if (types[0].equals("Water") == true)    { strokeColor = color(68,94,156);   }
      if (types[0].equals("Poison") == true)   { strokeColor = color(104,42,104);  }
      if (types[0].equals("Bug") == true)      { strokeColor = color(109,120,21);  }
      if (types[0].equals("Flying") == true)   { strokeColor = color(109,94,156);  }
      if (types[0].equals("Normal") == true)   { strokeColor = color(109,109,78);  }
      if (types[0].equals("Dark") == true)     { strokeColor = color(73,57,47);    }
      if (types[0].equals("Dragon") == true)   { strokeColor = color(73,36,161);   }
      if (types[0].equals("Electric") == true) { strokeColor = color(161,135,31);  }
      if (types[0].equals("Fairy") == true)    { strokeColor = color(155,100,112); }
      if (types[0].equals("Fighting") == true) { strokeColor = color(125,31,26);   }
      if (types[0].equals("Ghost") == true)    { strokeColor = color(73,57,99);    }
      if (types[0].equals("Ground") == true)   { strokeColor = color(146,125,68);  }
      if (types[0].equals("Ice") == true)      { strokeColor = color(99,141,141);  }
      if (types[0].equals("Psychic") == true)  { strokeColor = color(161,57,89);   }
      if (types[0].equals("Rock") == true)     { strokeColor = color(120,104,36);  }
      if (types[0].equals("Steel") == true)    { strokeColor = color(120,120,135); }
    }
  }
  
  
  void typetoLabel() {
    // first label
    if (types[0].equals("Grass") == true)    { label1 = grassLabel;  }
    if (types[0].equals("Fire") == true)     { label1 = fireLabel;  }
    if (types[0].equals("Water") == true)    { label1 = waterLabel;  }
    if (types[0].equals("Poison") == true)   { label1 = poisonLabel;  }
    if (types[0].equals("Bug") == true)      { label1 = bugLabel;  }
    if (types[0].equals("Flying") == true)   { label1 = flyingLabel;  }
    if (types[0].equals("Normal") == true)   { label1 = normalLabel;  }
    if (types[0].equals("Dark") == true)     { label1 = darkLabel;  }
    if (types[0].equals("Dragon") == true)   { label1 = dragonLabel;  }
    if (types[0].equals("Electric") == true) { label1 = electricLabel;  }
    if (types[0].equals("Fairy") == true)    { label1 = fairyLabel;  }
    if (types[0].equals("Fighting") == true) { label1 = fightingLabel;  }
    if (types[0].equals("Ghost") == true)    { label1 = ghostLabel;  }
    if (types[0].equals("Ground") == true)   { label1 = groundLabel;  }
    if (types[0].equals("Ice") == true)      { label1 = iceLabel;  }
    if (types[0].equals("Psychic") == true)  { label1 = psychicLabel;  }
    if (types[0].equals("Rock") == true)     { label1 = rockLabel;  }
    if (types[0].equals("Steel") == true)    { label1 = steelLabel;  }
    
    // second type label for pokemon with two types
    if (types.length == 2) {
      if (types[1].equals("Grass") == true)    { label2 = grassLabel;  }
      if (types[1].equals("Fire") == true)     { label2 = fireLabel;  }
      if (types[1].equals("Water") == true)    { label2 = waterLabel;  }
      if (types[1].equals("Poison") == true)   { label2 = poisonLabel;  }
      if (types[1].equals("Bug") == true)      { label2 = bugLabel;  }
      if (types[1].equals("Flying") == true)   { label2 = flyingLabel;  }
      if (types[1].equals("Normal") == true)   { label2 = normalLabel;  }
      if (types[1].equals("Dark") == true)     { label2 = darkLabel;  }
      if (types[1].equals("Dragon") == true)   { label2 = dragonLabel;  }
      if (types[1].equals("Electric") == true) { label2 = electricLabel;  }
      if (types[1].equals("Fairy") == true)    { label2 = fairyLabel;  }
      if (types[1].equals("Fighting") == true) { label2 = fightingLabel;  }
      if (types[1].equals("Ghost") == true)    { label2 = ghostLabel;  }
      if (types[1].equals("Ground") == true)   { label2 = groundLabel;  }
      if (types[1].equals("Ice") == true)      { label2 = iceLabel;  }
      if (types[1].equals("Psychic") == true)  { label2 = psychicLabel;  }
      if (types[1].equals("Rock") == true)     { label2 = rockLabel;  }
      if (types[1].equals("Steel") == true)    { label2 = steelLabel;  }
    }
  }
}