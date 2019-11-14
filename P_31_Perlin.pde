import peasy.*;

PeasyCam cam;

float detail = 0.05;    //skalowanie szumu (im więcej, tym ostrzejsze szczyty)
float h=200;            //maksymalna wysokość
int w=5;                //odległość między wierzchołkami
int cols=200;           //rozmiar siatki
int rows=200;           //rozmiar siatki

int time=0;            //trzeci wymiar szumu sterowany klawiszami

Peak[][] grid = new Peak[cols][rows];

void setup()
{
  fullScreen(P3D);
  //size(800,600,P3D);
  colorMode(HSB,250);
  cam = new PeasyCam(this, 400);
  
  generate();
}

void generate()    //funkcja generująca nowe punkty
{
  for(int x=0;x<cols;x++)
    for(int y=0;y<rows;y++)
      grid[x][y]=new Peak(x,y);
       
  for(int x=0;x<cols;x++)
    for(int y=0;y<rows;y++)
      grid[x][y].findN();
}

void draw()
{
  background(0);
  translate(-cols*0.5*w,-rows*0.5*w,0);  //środkowanie siatki na ekranie
  
  for(int x=0;x<cols;x++)        //renerowanie siatki
    for(int y=0;y<rows;y++)
      grid[x][y].show();

  if(keyPressed)
  {
    if (key == '1' || key == 32) time++;
    if (key == '2') time--;
    generate();
  }
}
