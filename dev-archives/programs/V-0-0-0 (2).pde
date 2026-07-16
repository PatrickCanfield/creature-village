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
  int acrex;
  int acrey;
  int tinyx;
  int tinyy;
  
  Player(String name, int acrex, int acrey, int tinyx, int tinyy) {
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
  size(480,480, P2D); //May change to 640,480
  surface.setIcon(createImage(1,2,3));
  mainFont = createFont("Consolas Italic", 32);
  //String[] fontList = PFont.list();
  //printArray(fontList);
  acre_defs = loadJSONObject("acre_defs.json");
  acregen();
  //print(acre_defs);
}

void draw() {
  /* SETUP */
  background(172);
  fill(255);
  mainFont = createFont("Consolas Italic", 32);
  textFont(mainFont);
  textSize(20);
  text("CREATURE VILLAGE DEMO V0-0-0",20,20);
  textSize(16);
  //print(java.util.Arrays.deepToString(map));
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
  menu("acre_map");
  /* DEMO HUD */
  stroke(0);
  strokeWeight(1);
  fill(172);
  rect(0,height-40,width,40);
  fill(255);
  textFont(mainFont);
  text(str(hour())+":"+str(minute()),10,height-10);
  text(str(month())+"/"+str(day())+"/"+str(year()),(width/5)*3,height-10);
  //menu("letter");
}

void menu(String menu) {
  switch(menu){
    case "acre_map":
      for (int y=0;y<map.length;y++) {
        for (int x=0;x<map[y].length;x++) {
          String acre_type = acre_defs.getJSONObject(str(map[y][x])).getString("name");
          PImage acre_menu = loadImage("loc-acre-"+acre_type.toLowerCase()+".png");
          image(acre_menu, (x*32)+width/2,(y*32)+height/3);
        }
      }
      break;
    case "inventory":
      //TODO: Inv
      break;
    case "letter":
      fill(255);
      rect(10,10,width-20,height-20);
      fill(0);
      mainFont = createFont("Consolas Italic", 32);
      textFont(mainFont);
      textSize(30);
      strokeWeight(2);
      stroke(0);
      text("Demo Letter Header",20,40);
      textSize(20);
      noStroke();
      text("Hi there, Player!\nHow have you been doing?\nCreature Village Demo Progress has been\ngoing well!\n;)\n\n   - Patrick C.",20,80);
      break;
    default:
      print("NONEXISTENT MENU REQUESTED");
      break;
  }
}

//NOTE: What if bulletin board is renamed to
//New York Times if town name is New York or New York City,
//or Washington Post if town name is Washington,
//or Los Angeles Times L.A.,
//or San Francisco Chronicle for S.F.,
//or The Guardian for London,
//or The Yomiuri Shimbun for Tokyo.
