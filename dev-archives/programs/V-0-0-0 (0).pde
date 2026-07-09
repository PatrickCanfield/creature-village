PFont mainFont;
JSONObject acre_defs;
byte[][] map = {
  {0}, //0th Street
  {0,0,0,0,0}, //1st Street
  {0,0,0,0,0}, //2nd Street
  {0,0,0,0,0}, //3rd Street
  {0,0,0,0,0}, //4th Street
  {0,0,0,0,0}, //5th Street
};

//TODO: Add save data.

class Player {
  String name;
  byte acrex;
  byte acrey;
  byte tinyx;
  byte tinyy;
  
  Player(String name, byte acrex, byte acrey, byte tinyx, byte tinyy) {
    this.name = name; this.acrex = acrex; this.acrey = acrey; this.tinyx = tinyx; this.tinyy = tinyy;
    //TODO: Add player movement.
    //TODO: Add player collision.
    //TODO: Add player rendering.
    //TODO: Add multiple players (either local co-op or seperate instance).
  }
}

void acregen() {
  /* 
  /* TOWNGEN */
  //for (byte[] x : map) {
  //  random(0);
  //  for (byte y : x) {
  //    random(0);
  //  }
  //}
  // TODO: Add town generation.
  /* PREDEF'D MAPS */
  byte[][] testmap0 = {
    {1}, //0th Street
    {1,1,1,1,1}, //1st Street
    {1,2,2,2,1}, //2nd Street
    {1,2,2,2,1}, //3rd Street
    {1,1,1,1,1}, //4th Street
    {3,3,3,3,3}, //5th Street
  };
  map = testmap0;
}

void setup() {
  size(480,480); //May change to 640,480
  mainFont = createFont("Consolas Italic", 32);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  acre_defs = loadJSONObject("acre_defs.json");
  acregen();
  //print(acre_defs);
  background(172);
  textFont(mainFont);
  textSize(20);
  text("CREATURE VILLAGE DEMO V0-0-0",20,20);
  textSize(16);
  print(java.util.Arrays.deepToString(map));
  String map_data_string = "MAP:\n%s".formatted(java.util.Arrays.deepToString(map));
  text(map_data_string.replace("],","],\n"),20,40);
  PImage loc_0 = loadImage("location-zeroth.png");
  PImage loc_1 = loadImage("location-first.png");
  PImage loc_st = loadImage("location-zone-street.png");
  PImage loc_av = loadImage("location-zone-avenue.png");
  image(loc_0, 64, height/2);
  image(loc_st, 64+32, height/2);
  image(loc_1, 128, height/2);
  image(loc_av, 128+32, height/2);
}
