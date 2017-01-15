import processing.serial.*;

PFont font;
int s = 20;
float w;
float c;
float y;
float l;
float m;
float d;
float h;

//FONT SIZES
int h1= 52;
int p= 24;
int h3 = 32;
//
int bx = 200;
int by = 200;
int bxs = 6;
int bys = 4;
 int xart;
int bx1 = 200;
int by1 = 200;
int bxs1 = -3;
int bys1 = -2;
 
int bx2 = 200;
int by2 = 200;
int bxs2 = 2;
int bys2 = 1;
 int currentTemp=0;
 int weatherstatus;
 int week;
 int events=0;
 String event;
 String when;
String M = "January";
String D = "Sunday";
int currentcount = 104;
//

 float push=400;

  String  wdata[];


void setup(){
 
    size(1280,1020);
    font = createFont("Helvetica", 72);
    textFont(font, h1);


}

    

void draw(){

    background(0);
    fill(0);
    stroke(255);
    rect(10,10,width-20,height-20);
     int texcol = 255;
     int fillcol = 0;

weather();
     println(mouseX, mouseY);

    fill(fillcol);
    noStroke();
    rectMode(CORNER);
    
    //EVENTS ANIMATION
    fill(255);
    
     
       fill(255);
        textSize(p);
        text("Week: "+week,width-push,height-90);
        stroke(255);
        line(width-(push+10),height-60,width-(push+10),height-110);
        if(events==1){
        text("You have "+events+" event this week",width-push,height-60);
        }else{
           text("You have "+events+" events this week",width-push,height-60);
        }
        if(events>=1){
           line(width-(push+200),height-60,width-(push+200),height-110);
           text(event,width-(push+180),height-60);
           text(when,width-(push+180),height-90);
        }
     

     //println(push);
    textFont(font, 52);
     
     float dateheight = 170;
     float timeheight = 120;
    fill(texcol);
    if(hour() <= 12 && hour() > 0 && minute() > 9){
        text(hour()+":"+minute(),s,timeheight);
    }
    if(hour() <= 12 && hour() > 0 && minute() <= 9){
        text(hour()+":"+"0"+minute(),s,timeheight);
    }
    if(hour() > 12 && minute() > 9){
        text(hour()-12+":"+minute(),s,timeheight);
    }
    if(hour() > 12 && minute() <= 9){
        text(hour()-12+":"+"0"+minute(),s,timeheight);
    }
     
    if(hour() == 0 && minute() > 9){
        text("12"+":"+minute(),s,timeheight);
    }
    if(hour() == 0 && minute() <= 9){
        text("12"+":"+"0"+minute(),s,timeheight);
    }
     /**
    if(day() > 9 && month() > 9){ 
        text(day()+"/"+month()+"/"+year(),10,dateheight);
    }
     
    if(day() < 10 && month() > 9){ 
        text("0"+day()+"/"+month()+"/"+year(),10,dateheight);
    }
     
    if(day() > 9 && month() < 10){ 
        text(day()+"/"+"0"+month()+"/"+year(),10,dateheight);
    }
     **/
    textFont(font, 30);
     
    if(second() < 10){
        text("0"+second(),170,timeheight);
    }
     
    if(second() > 9){
        text(second(),170,timeheight);
    }
     
    if(hour() < 12){
        text("AM",210,timeheight);
    }
    else{
        text("PM",210,timeheight);
    }
   
    textFont(font, 50);
    //11 / March
    text(day()+" / "+M,20,200);

    //MONTH
    //text(M,10,215);
    //second timer
    float tick = lerp(0,3,(second()*1.3));
    stroke(255);
    line(25,145,262,145);
     noStroke();
    rect(25+tick,141,10,10);
  calendar();
     positions(0,height-200);
    if(month() == 1){ M = "January";}
    if(month() == 2){ M = "February";}
    if(month() == 3){ M = "March";}
    if(month() == 4){ M = "April";}
    if(month() == 5){ M = "May";}
    if(month() == 6){ M = "June";}
    if(month() == 7){ M = "July";}
    if(month() == 8){ M = "August";}
    if(month() == 9){ M = "September";}
    if(month() == 10){ M = "October";}
    if(month() == 11){ M = "November";}
    if(month() == 12){ M = "December";}
     
     
    c = 4;
    y = year() - 2000;
    l = floor(y/4);
    if(month() == 1){ m = 3;}
    if(month() == 2){ m = 6;}
    if(month() == 3){ m = 6;}
    if(month() == 4){ m = 2;}
    if(month() == 5){ m = 4;}
    if(month() == 6){ m = 0;}
    if(month() == 7){ m = 2;}
    if(month() == 8){ m = 5;}
    if(month() == 9){ m = 1;}
    if(month() == 10){ m = 3;}
    if(month() == 11){ m = 6;}
    if(month() == 12){ m = 5;}
     
    d = day();
    h = c+y+m+l+d;
     
    if(y==4||y==8||y==12||y==16||y==20||y==24||y==28||y==32||y==36||y==40){
        w=h%7-1;
    }
    else{
        w=h%7;
    }
     
    if(w == 1){ D="Monday";}
    if(w == 2){ D="Tuesday";}
    if(w == 3){ D="Wednesday";}
    if(w == 4){ D="Thursday";}
    if(w == 5){ D="Friday";}
    if(w == 6){ D="Saturday";}
    if(w == 7){ D="Sunday";}
          
      fill(255);
       //DAY
       textSize(52);
    text(D,25,60);
    stroke(255);
     //REMINDERS
     textSize(24);
    text("Today:",20,250);
     if(D == "Monday"){
       text("MDDN 352 9:30 - 12:20",20,280);
       text("MDDN 241 3:40 - 5:30",20,310);
        line(20,320,120,320);
      text("Tomorrow:",20,345);
       text("CCDN 384 12:40 - 1:30",20,370);
    }
    if(D == "Tuesday"){
      text("CCDN 384 12:40 - 1:30",20,280);
      
      line(20,290,120,290);
      text("Tomorrow:",20,315);
       text("MDDN 241 10:30 - 1:30",20,340);
    }
    if(D == "Wednesday"){
      text("MDDN 241 10:30 - 1:30",20,310);
      text("Pay Rent Tomorrow",20,280);
       line(20,320,120,320);
      text("Tomorrow:",20,345);
      text("MDDN 352 9:30 - 12:20",20,370);
       text("CCDN 384 3:40 - 5:30",20,395);
    }
     if(D == "Thursday"){
      text("Pay Rent Today",20,280);
      text("MDDN 352 9:30 - 12:20",20,310);
       text("CCDN 384 3:40 - 5:30",20,340);
    }
    if(D == "Friday"){
      text("Enjoy your day off!",20,280);
    }
    if(D == "Saturday"){
      text("Enjoy your weekend!",20,280);
    }
    if(D == "Sunday"){
      text("Back to class tomorrow",20,280);
    }
    //
     /****/
}  

 void positions(float x, float y){
   textSize(24);
   float posy = y;
     String lines[] = loadStrings("reminders.txt");
//println("there are " + lines.length + " lines");
for (int i = 0 ; i < lines.length; i++) {
  posy+=30;
  //println(lines[i]);
  fill(255);
  text(lines[i],20+x,posy);
}}


void weather(){
  //THIS IS WHERE YOU WILL NEED TO FIND A WEATHER SOURCE FOR YOUR CITY
   wdata = loadStrings("http://www.accuweather.com/en/nz/wellington/250938/weather-forecast/250938");
  //the 217 in wdata[217] is refering to the 217th line of code from the above webpage which contains the temp and conditions
  String myconditions = wdata[217];
  String condit = myconditions;
  println(myconditions);
  fill(255);
  textSize(p);
   //ICONS FOR WEATHER CONDITION
  PImage Sunny;
  PImage Partlysunny;
  PImage Mostlycloudy;
   PImage Partlycloudy;
  PImage Cloudy;
  PImage Clear;
  PImage Lightrain;
  PImage Rain;
  PImage Mist;
  Clear = loadImage("Clearicon.jpg");
  Sunny = loadImage("Sunnyicon.jpg");
  Mostlycloudy = loadImage("Mostlycloudyicon.jpg");
  Partlycloudy= loadImage("Partlycloudyicon.jpg");
  Partlysunny= loadImage("Partlysunnyicon.jpg");
  Cloudy = loadImage("Cloudyicon.jpg");
  Lightrain = loadImage("Lightrainicon.jpg");
  Rain = loadImage("Rainicon.jpg");
   Mist = loadImage("Misticon.jpg");
  //CHECK FOR WEATHER CONDITIONS IN WEATHER STRING

 
  //println(current);
  boolean weathercheck = myconditions.contains("Cloudy");
  boolean weathercheck2 = myconditions.contains("Sunny");
   boolean weathercheck3 = myconditions.contains("Mostly cloudy");
  boolean weathercheck4 = myconditions.contains("Partly cloudy");
  boolean weathercheck5 = myconditions.contains("Clear");
  boolean weathercheck6 = myconditions.contains("Partly sunny");
   boolean weathercheck7 = myconditions.contains("Light rain");
   boolean weathercheck8 = myconditions.contains("Rain");
      boolean weathercheck9 = myconditions.contains("Mist");
  
    //TEST FOR CONDITION AND DISPLAY APPROPRIATE ICON
     if(weathercheck == true){
      //Display Cloudy icon
      image(Cloudy, width-170, 30);
      text("Cloudy",width-140,180);
    }
    if(weathercheck2 == true){
      //Display Sunny icon
      image(Sunny, width-170, 30);
      text("Sunny",width-140,180);
      
    }
    if(weathercheck3 == true){
      //Display Mostly cloudy icon
      
      image(Mostlycloudy, width-180, 30);
      text("Mostly Cloudy",width-190,180);
    }
     if(weathercheck4 == true){
      //Display Partly cloudy icon
      
      image(Partlycloudy, width-180, 30);
      text("Partly Cloudy",width-180,180);
      
    }
     if(weathercheck5 == true){
      //Display Clear icon
      image(Clear, width-180, 30);
      text("Clear",width-130,180);
    }
     if(weathercheck6 == true){
      //Display Partly sunny icon
      image(Partlysunny, width-170, 30);
      text("Partly sunny",width-180,190);
    }
     if(weathercheck7 == true){
      //Display Partly sunny icon
      image(Lightrain, width-170, 30);
      text("Light rain",width-140,180);
    }
    if(weathercheck8 == true){
      //Display Partly sunny icon
      image(Rain, width-170, 30);
      text("Rain",width-140,180);
    }
      if(weathercheck9 == true){
      //Display Partly sunny icon
      image(Mist, width-170, 30);
      text("Mist",width-140,180);
    }
//current temp
boolean temptest1 = condit.contains("temp:'1'");
boolean temptest2 = condit.contains("temp:'2'");
boolean temptest3 = condit.contains("temp:'3'");
boolean temptest4 = condit.contains("temp:'4'");
boolean temptest5 = condit.contains("temp:'5'");
boolean temptest6 = condit.contains("temp:'6'");
boolean temptest7 = condit.contains("temp:'7'");
boolean temptest8 = condit.contains("temp:'8'");
boolean temptest9 = condit.contains("temp:'9'");
boolean temptest10 = condit.contains("temp:'10'");
boolean temptest11 = condit.contains("temp:'11'");
boolean temptest12 = condit.contains("temp:'12'");
boolean temptest13 = condit.contains("temp:'13'");
boolean temptest14 = condit.contains("temp:'14'");
boolean temptest15 = condit.contains("temp:'15'");
boolean temptest16 = condit.contains("temp:'16'");
boolean temptest17 = condit.contains("temp:'17'");
boolean temptest18 = condit.contains("temp:'18'");
boolean temptest19 = condit.contains("temp:'19'");
boolean temptest20 = condit.contains("temp:'20'");
boolean temptest21 = condit.contains("temp:'21'");
boolean temptest22 = condit.contains("temp:'22'");
boolean temptest23 = condit.contains("temp:'23'");
boolean temptest24 = condit.contains("temp:'24'");
boolean temptest25 = condit.contains("temp:'25'");
boolean temptest26 = condit.contains("temp:'26'");
boolean temptest27 = condit.contains("temp:'27'");
boolean temptest28 = condit.contains("temp:'28'");
boolean temptest29 = condit.contains("temp:'29'");
boolean temptest30 = condit.contains("temp:'30'");

if(temptest1==true){
  println("current temp: 1");
   weatherstatus=1;
}
if(temptest2==true){
  println("current temp: 2");
   weatherstatus=2;
}

if(temptest3==true){
  println("current temp: 3");
  weatherstatus=3;
}
if(temptest4==true){
  println("current temp: 4");
  weatherstatus=4;
}
if(temptest5==true){
  println("current temp: 5");
  weatherstatus=5;
}
if(temptest6==true){
  println("current temp: 7");
  weatherstatus=7;
}
if(temptest8==true){
  println("current temp: 8");
  weatherstatus=8;
}
if(temptest9==true){
  println("current temp: 9");
  weatherstatus=9;
}
if(temptest10==true){
  println("current temp: 10");
  weatherstatus=10;
}
if(temptest11==true){
  println("current temp: 11");
  weatherstatus=11;
}
if(temptest12==true){
  println("current temp: 13");
  weatherstatus=12;
}
if(temptest13==true){
  println("current temp: 13");
  weatherstatus=13;
}
if(temptest14==true){
  println("current temp: 14");
  weatherstatus=14;
}
if(temptest15==true){
  println("current temp: 15");
  weatherstatus=15;
}
if(temptest16==true){
  println("current temp: 16");
  weatherstatus=16;
}
if(temptest17==true){
  println("current temp: 17");
  weatherstatus=17;
}
if(temptest18==true){
  println("current temp: 18");
  weatherstatus=18;
}
if(temptest19==true){
  println("current temp: 19");
  weatherstatus=19;
}
if(temptest20==true){
  println("current temp: 20");
  weatherstatus=20;
}
if(temptest21==true){
  println("current temp: 21");
  weatherstatus=21;
}

if(temptest22==true){
  println("current temp: 22");
  weatherstatus=22;
}
if(temptest23==true){
  println("current temp: 23");
  weatherstatus=23;
}

if(temptest24==true){
  println("current temp: 24");
  weatherstatus=24;
}
if(temptest25==true){
  println("current temp: 25");
  weatherstatus=25;
}
if(temptest26==true){
  println("current temp: 26");
  weatherstatus=26;
}
if(temptest27==true){
  println("current temp: 27");
  weatherstatus=27;
}
if(temptest28==true){
  println("current temp: 28");
  weatherstatus=28;
}
if(temptest29==true){
  println("current temp: 29");
  weatherstatus=29;
}
if(temptest30==true){
  println("current temp: 30");
  weatherstatus=30;
}
  fill(255);
 //TEMPRATURE DISPLAY
 textSize(64);
 //
 
//Print current temprature



  //
  // LIST OF POSSIBLE TEMPRATURES FOR TOMORROW
  
  textSize(52);
 text(weatherstatus+"°",width-230,106);
  //
  //text(weatherstatus,10,450);
  //println(temprature);
  
  
  
}
 void calendar(){
   //THIS LOOP IS WHERE YOU WILL ADD YOUR EVENTS FOR THE YEAR
   fill(255);
   //DAY SELECTER
       if(day()==11 && month() == 3){
         fill(255);
        
        }
        //WEEK SELECTER
        //JANUARY
        if(day()>=1 && day()<=2 && month() == 1){
          week = 1;
        }
         if(day()>=3 && day()<=9 && month() == 1){
          week = 2;
        }
         if(day()>=10 && day()<=16  && month() == 1){
          week = 3;
        }
         if(day()>=17 && day()<=23  && month() == 1){
          week = 4;
        }
         if(day()>=24 && day()<=30  && month() == 1){
          week = 5;
        }
        //stray day
        if(day()==31 && month() == 1){
          week = 6;
        }
        //FEBRUARY
         if(day()>=1 && day()<=6  && month() == 2){
          week = 6;
        }
         if(day()>=7 && day()<=13  && month() == 2){
          week = 7;
        }
         if(day()>=14 && day()<=20  && month() == 2){
          week = 8;
        }
         if(day()>=21 && day()<=27  && month() == 2){
          week = 9;
        }
         if(day()>=28 && day()<=29  && month() == 2){
          week = 10;
        }
        //MARCH
         if(day()>=1 && day()<=5 && month() == 3){
          week = 10;
        }
         if(day()>=6 && day()<=12 && month() == 3){
           //Here is an example of an event
          week = 11;
          events = 1;
          event = "Presentation";
          when = "Tuesday";
        }
         if(day()>=13 && day()<=19 && month() == 3){
          week = 12;
          events = 1;
          event = "Keep Coding";
          when = "All Week";
        }
         if(day()>=20 && day()<=26 && month() == 3){
          week = 13;
        }
         if(day()>=27 && day()<=31 && month() == 3){
          week = 14;
        }
         //APRIL
         if(day()>=1 && day()<=2 && month() == 4){
          week = 14;
        }
         if(day()>=3 && day()<=9 && month() == 4){
          week = 15;
            events = 1;
          event = "Sticky Fingers";
          when = "Friday";
        }
         if(day()>=10 && day()<=16 && month() == 4){
          week = 16;
        }
         if(day()>=17 && day()<=23 && month() == 4){
          week = 17;
        }
         if(day()>=24 && day()<=30 && month() == 4){
          week = 18;
        }
        
       //MAY
         if(day()>=1 && day()<=7 && month() == 5){
          week = 19;
        }
         if(day()>=8 && day()<=14 && month() == 5){
          week = 20;
        }
         if(day()>=15 && day()<=21 && month() == 5){
          week = 21;
        }
         if(day()>=22 && day()<=28 && month() == 5){
          week = 22;
        }
        if(day()>=29 && day()<=31 && month() == 5){
          week = 23;
        }
         //JUNE
          if(day()>=1 && day()<=4 && month() == 6){
          week = 23;
        }
         if(day()>=5 && day()<=11 && month() == 6){
          week = 24;
        }
         if(day()>=12 && day()<=18 && month() == 6){
          week = 25;
        }
         if(day()>=19 && day()<=25 && month() == 6){
          week = 26;
        }
         if(day()>=26 && day()<=30 && month() == 6){
          week = 27;
        }
       
          //JULY
          if(day()>=1 && day()<=2 && month() == 6){
          week = 27;
        }
         if(day()>=3 && day()<=9 && month() == 7){
          week = 28;
        }
         if(day()>=10 && day()<=16 && month() == 7){
          week = 29;
        }
         if(day()>=17 && day()<=23 && month() == 7){
          week = 30;
        }
         if(day()>=24 && day()<=30 && month() == 7){
          week = 31;
        }
          //stray day
        if(day()==31 && month() == 7){
          week = 32;
        }
            //AUGUST
         if(day()>=1 && day()<=6 && month() == 8){
          week = 32;
        }
         if(day()>=7 && day()<=13 && month() == 8){
          week = 33;
        }
         if(day()>=14 && day()<=20 && month() == 8){
          week = 34;
        }
         if(day()>=21 && day()<=27 && month() == 8){
          week = 35;
        }
         if(day()>=28 && day()<=31 && month() == 8){
          week = 36;
        }
              //SEPTEMBER
              if(day()>=1 && day()<=3 && month() == 8){
          week = 36;
        }
         if(day()>=4 && day()<=10 && month() == 9){
          week = 37;
        }
         if(day()>=11 && day()<=17 && month() == 9){
          week = 38;
        }
         if(day()>=18 && day()<=24 && month() == 9){
          week = 39;
        }
         if(day()>=25 && day()<=30 && month() == 9){
          week = 40;
        }
             //OCTOBER
              //stray day
        if(day()==1 && month() == 10){
          week = 40;
        }
         if(day()>=2 && day()<=8 && month() == 10){
          week = 41;
        }
         if(day()>=9 && day()<=15 && month() == 10){
          week = 42;
        }
         if(day()>=16 && day()<=22 && month() == 10){
          week = 43;
        }
         if(day()>=23 && day()<=29 && month() == 10){
          week = 44;
        }
        if(day()>=30 && day()<=31 && month() == 10){
          week = 45;
        }
           //NOVEMBER
           if(day()>=1 && day()<=5 && month() == 10){
          week = 45;
        }
         if(day()>=6 && day()<=12 && month() == 11){
          week = 46;
        }
         if(day()==14 && month() == 11){
          week = 47;
        }
         if(day()>=13 && day()<=19 && month() == 11){
          week = 48;
        }
         if(day()>=20 && day()<=26 && month() == 11){
          week = 49;
        }
         if(day()>=27 && day()<=30 && month() == 11){
          week = 50;
        }
          //DECEMBER
          if(day()>=1 && day()<=3 && month() == 12){
          week = 50;
        }
         if(day()>=4 && day()<=10 && month() == 12){
          week = 51;
        }
         if(day()>=11 && day()<=17 && month() == 12){
          week = 51;
        }
         if(day()>=18 && day()<=24 && month() == 12){
          week = 52;
        }
         if(day()>=25 && day()<=31 && month() == 12){
          week = 53;
        }
       
     }