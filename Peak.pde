class Peak
{
  int x, y;      //współżędne punktu w siatce
  float z;       //wysokość
  float[] nVal=new float[2];  //wysokości sąsiadów (lewy, górny)
  
  Peak(int x,int y)
  {
    this.x=x;
    this.y=y;
    this.z=noise(x*detail,y*detail,time*detail/4); //generowanie wysokości (4 to dodatkowe skalowanie osi 'Z')
  }
  
  void findN()                //pobieranie wysokości sąsiadów
  {
    if(x==0) nVal[0]=0;
    else nVal[0]=grid[x-1][y].z;
    
    if(y==0) nVal[1]=0;
    else nVal[1]=grid[x][y-1].z;
  }
  
  void show()              //rysowanie lini między punktem, a jego dwoma sąsiadami
  {
    stroke(z*255,100,255);
    if(x!=0)
      line(this.x*w, this.y*w, 1.0*this.z*h, (x-1)*w, y*w,    1.0*nVal[0]*h);
    if(y!=0)
      line(this.x*w, this.y*w, 1.0*this.z*h,  x*w,   (y-1)*w, 1.0*nVal[1]*h);
  }
}
