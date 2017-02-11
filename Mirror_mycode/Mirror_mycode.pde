import processing.serial.*;
import java.util.Calendar;

PFont font;

//FONT SIZES
int p= 24;

// Default width-positions on left
int leftPositions = 10;
// Default width-positions on right
float rightPositions = width+990;


int intDayOfWeek;

void setup() {
  
  fullScreen();
  Calendar c = Calendar.getInstance();
  intDayOfWeek = c.get(Calendar.DAY_OF_WEEK);
  //size(1440, 900);
  font = createFont("Helvetica", 72);
  textFont(font, 52);
  
}

void draw() {

  background(0);
  
  weatherIcon();
  currency();
  //stocks();
  displayTime();
  days();
  months();
  gasPrice();
  weatherJSON();
  sunRiseAndSet();
  
}


// --------------------------------------------------------------------------------------------------------------------------------------------------------------------
void weatherIcon() {
  String data[] = loadStrings("http://www.accuweather.com/en/is/kopavogur/190389/weather-forecast/190389");
  String myconditions = data[201];
  //println(myconditions);

  PImage Sunny = loadImage("Sunnyicon.jpg");
  PImage Partlysunny = loadImage("Partlysunnyicon.jpg");
  PImage Mostlycloudy = loadImage("Mostlycloudyicon.jpg");
  PImage Partlycloudy = loadImage("Partlycloudyicon.jpg");
  PImage Cloudy = loadImage("Cloudyicon.jpg");
  PImage Clear = loadImage("Clearicon.jpg");
  PImage Lightrain = loadImage("Lightrainicon.jpg");
  PImage Rain = loadImage("Rainicon.jpg");
  PImage Mist = loadImage("Misticon.jpg");
  PImage Snow = loadImage("Snowicon.jpg");
  PImage Lightsnow = loadImage("Lightsnowicon.jpg");
  
  boolean weathercheck = myconditions.contains("Cloudy");
  boolean weathercheck2 = myconditions.contains("Sunny");
  boolean weathercheck3 = myconditions.contains("Mostly cloudy");
  boolean weathercheck4 = myconditions.contains("Partly cloudy");
  boolean weathercheck5 = myconditions.contains("Clear");
  boolean weathercheck6 = myconditions.contains("Partly sunny");
  boolean weathercheck7 = myconditions.contains("Light rain");
  boolean weathercheck8 = myconditions.contains("Rain");
  boolean weathercheck9 = myconditions.contains("Mist");
  boolean weathercheck10 = myconditions.contains("Snow");
  boolean weathercheck11 = myconditions.contains("Light snow");
  boolean weathercheck12 = myconditions.contains("Freezing drizzle");
  boolean weathercheck13 = myconditions.contains("Light freezing drizzle");
  boolean weathercheck14 = myconditions.contains("Drizzle/rain");

  println(myconditions);
  //TEST FOR CONDITION AND DISPLAY APPROPRIATE ICON
  if (weathercheck == true) { image(Cloudy, rightPositions+120, 10); }
  if (weathercheck2 == true) { image(Sunny, rightPositions+120, 10); }
  if (weathercheck3 == true) { image(Mostlycloudy, rightPositions+120, 10); }
  if (weathercheck4 == true) { image(Partlycloudy, rightPositions+120, 10); }
  if (weathercheck5 == true) { image(Clear, rightPositions+120, 10); }
  if (weathercheck6 == true) { image(Partlysunny, rightPositions+120, 10); }
  if (weathercheck7 == true) { image(Lightrain, rightPositions+120, 10); }
  if (weathercheck8 == true) { image(Rain, rightPositions+120, 10); }
  if (weathercheck9 == true) { image(Mist, rightPositions+120, 10); }
  if (weathercheck10 == true) { image(Snow, rightPositions+120, 10); }
  if (weathercheck11 == true) { image(Snow, rightPositions+120, 10); }
  if (weathercheck12 == true) { image(Lightsnow, rightPositions+120, 10); }
  if (weathercheck13 == true) { image(Lightsnow, rightPositions+120, 10); }
  if (weathercheck14 == true) { image(Rain, rightPositions+120, 10); }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void weatherJSON() { 
  
//String weatherConditions[] = { "Léttskýjað", "Heiðskírt", "Alskýjað", "Skýjað", "Rigning", "Lítils háttar rigning", "Lítils háttar snjókoma", "Skúrir", "Slydda", "Snjóél" };

JSONObject json = loadJSONObject("http://apis.is/weather/forecasts/is?stations=1");
JSONArray results = json.getJSONArray("results");
JSONObject temperatureAtNoon = results.getJSONObject(0); 
JSONArray forecast = temperatureAtNoon.getJSONArray("forecast");

// Find temperature for current time 
JSONObject temperature = forecast.getJSONObject(3);
String temp = temperature.getString("T");
String tempTime = temperature.getString("ftime");
String description = temperature.getString("W");
String wind = temperature.getString("F");

// Find temperature for noon next day
JSONObject temperature1 = forecast.getJSONObject(12);
String temp1 = temperature1.getString("T");
String tempTime1 = temperature1.getString("ftime");
String description1 = temperature1.getString("W");
String wind1 = temperature1.getString("F");
//println("Time: " + tempTime1);
//println("Temperature: " + temp1);
//println("Description: " + description1);

// Find temperature for noon day after tomorrow
JSONObject temperature2 = forecast.getJSONObject(36);
String temp2 = temperature2.getString("T");
String tempTime2 = temperature2.getString("ftime");
String description2 = temperature2.getString("W");
String wind2 = temperature2.getString("F");
//println("Time: " + tempTime2);
//println("Temperature: " + temp2);
//println("Description: " + description2);

// Find temperature for noon day after tomorrow
JSONObject temperature3 = forecast.getJSONObject(60);
String temp3 = temperature3.getString("T");
String tempTime3 = temperature3.getString("ftime");
String description3 = temperature3.getString("W");
String wind3 = temperature3.getString("F");
//println("Time: " + tempTime3);
//println("Temperature: " + temp3);
//println("Description: " + description3);

textSize(150);
text(temp+"°", rightPositions, 120);
textSize(30);
text(description + "   " + wind + "m/s", rightPositions, 170);

textSize(20);
text(temp1 + "°", rightPositions+60, 280);
text(temp2 + "°", rightPositions+60, 305);
text(temp3 + "°", rightPositions+60, 330);

text(description1 + "   " + wind1 + "m/s", rightPositions+90, 280);
text(description2 + "   " + wind2 + "m/s", rightPositions+90, 305);
text(description3 + "   " + wind3 + "m/s", rightPositions+90, 330);

}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void currency() {
  
String EURChange2points = "";
String USDChange2points = "";
String GBPChange2points = "";
String DKKChange2points = "";
String GVTChange2points = "";

JSONObject json = loadJSONObject("http://apis.is/currency/lb");
JSONArray results = json.getJSONArray("results");
JSONObject EURLocation = results.getJSONObject(0); 
JSONObject USDLocation = results.getJSONObject(1); 
JSONObject GBPLocation = results.getJSONObject(2); 
JSONObject DKKLocation = results.getJSONObject(6); 
JSONObject GVTLocation = results.getJSONObject(17);


float EUR = EURLocation.getFloat("value");
float EURChange = EURLocation.getFloat("changeCur");
if (EURChange > 0) { EURChange2points = ("+" + nf(EURChange, 1, 2) + "%"); }
else if (EURChange < 0) { EURChange2points = (" " + EURChange + "%"); }

float USD = USDLocation.getFloat("value");
float USDChange = USDLocation.getFloat("changeCur");
if (USDChange > 0) { USDChange2points = ("+" + nf(USDChange, 1, 2) + "%"); }
else if (USDChange < 0) { USDChange2points = (" " + USDChange + "%"); }

float GBP = GBPLocation.getFloat("value");
float GBPChange = GBPLocation.getFloat("changeCur");
if (GBPChange > 0) { GBPChange2points = ("+" + nf(GBPChange, 1, 2) + "%"); }
else if (GBPChange < 0) { GBPChange2points = (" " + GBPChange + "%"); }

float DKK = DKKLocation.getFloat("value");
float DKKChange = DKKLocation.getFloat("changeCur");
if (DKKChange > 0) { DKKChange2points = ("+" + nf(DKKChange, 1, 2) + "%"); }
else if (DKKChange < 0) { DKKChange2points = (" " + DKKChange + "%"); }

float GVT = GVTLocation.getFloat("value");
float GVTChange = DKKLocation.getFloat("changeCur");
if (GVTChange > 0) { GVTChange2points = ("+" + nf(GVTChange, 1, 2) + "%"); }
else if (GVTChange < 0) { GVTChange2points = (" " + GVTChange + "%"); }


//println("EUR: " + nf(EUR, 3, 2) + "   " + EURChange2points);
//println("USD: " + nf(USD, 3, 2) + "   " + USDChange2points);
//println("GBP: " + nf(GBP, 3, 2) + "   " + GBPChange2points);
//println("DKK:  " + nf(DKK, 2, 2) + "   " + DKKChange2points);
//println("GVT: " + nf(GVT, 3, 2) + "   " + GVTChange2points);


textSize(20);
text("GVT:    " + nf(GVT, 2, 2) + "     " + GVTChange2points, rightPositions, 400);
text("USD:    " + nf(USD, 3, 2) + "     " + USDChange2points, rightPositions, 425);
text("GBP:    " + nf(GBP, 3, 2) + "     " + GBPChange2points, rightPositions, 450);
text("EUR:    " + nf(EUR, 3, 2) + "     " + EURChange2points, rightPositions, 475);
text("DKK:      " + nf(DKK, 2, 2) + "     " + DKKChange2points, rightPositions, 500);
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void stocks() {
  textSize(p);
  text("AAPL       119,78   -0,18%", rightPositions, 550);
  text("TWTR        16,79   -1,87%", rightPositions, 580);
  text("TSLA       243,76   +5,40%", rightPositions, 610);
  text("FB           127,55   -0,37%", rightPositions, 640);
  text("GOOG      802,18   -3,90%", rightPositions, 670);
  
  float x = width;
  int index = 0;
  String[] stocks = { "AAPL       119,78   -0,18%", "TWTR        16,79   -1,87%", "TSLA       243,76   +5,40%" };
  
  text(stocks[index], x, 10);
  x = x - 3;
  
  float w = textWidth(stocks[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % stocks.length;
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void gasPrice() {

JSONObject json = loadJSONObject("http://apis.is/petrol?");
JSONArray results = json.getJSONArray("results");
JSONObject eachLoctiton = results.getJSONObject(9); // Nr 9 er Kopavogsbraut

float bensin95 = eachLoctiton.getFloat("bensin95");
float bensin95_discount = eachLoctiton.getFloat("bensin95_discount");
float diesel = eachLoctiton.getFloat("diesel");
float diesel_discount = eachLoctiton.getFloat("diesel_discount");
String name = eachLoctiton.getString("name");

//println(name + ", " + bensin95 + ", " + diesel);

textSize(20);
text("Bensín '95    " + bensin95 + " / " + bensin95_discount, rightPositions, 550);
text("Dísel             " + diesel + " / " + diesel_discount, rightPositions, 575);
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void displayTime() {
  
textFont(font, 150);

int timeheight = 120;
    
  if(hour() <= 12 && hour() > 0 && minute() > 9){
    text(hour()+":"+minute(),leftPositions,timeheight);
  }
  
  if(hour() <= 12 && hour() > 0 && minute() <= 9){
    text(hour()+":"+"0"+minute(),leftPositions,timeheight);
  }
  
  if(hour() > 12 && minute() > 9){
    text(hour()+":"+minute(),leftPositions,timeheight);
  }
  
  if(hour() > 12 && minute() <= 9){
    text(hour()+":"+"0"+minute(),leftPositions,timeheight);
  }
  
  if(hour() == 0 && minute() > 9){
    text("00"+":"+minute(),leftPositions,timeheight);
  }
  
  if(hour() == 0 && minute() <= 9){
    text("00"+":"+"0"+minute(),leftPositions,timeheight);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void days() {
  
  String today = "Dagur";
  String tomorrow = "Dagur2";
  String dayAfterTomorrow = "Dagur3";
  String dayAfterTheDayAfterTomorrow = "Dagur4";  
  int dayheight = 200;
  
  if (intDayOfWeek == 1) {
    today = "Sunnudagur";
    tomorrow = "Mán";
    dayAfterTomorrow = "Þrið";
    dayAfterTheDayAfterTomorrow = "Mið";
  }
  if (intDayOfWeek == 2) {
    today = "Mánudagur";
    tomorrow = "Þrið   ";
    dayAfterTomorrow = "Mið   ";
    dayAfterTheDayAfterTomorrow = "Fimmt   ";
  }
  if (intDayOfWeek == 3) {
    today = "Þriðjudagur";
    tomorrow = "Mið";
    dayAfterTomorrow = "Fimmt";
    dayAfterTheDayAfterTomorrow = "Föst";
  }
  if (intDayOfWeek == 4) {
    today = "Miðvikudagur";
    tomorrow = "Fimmt";
    dayAfterTomorrow = "Föst";
    dayAfterTheDayAfterTomorrow = "Laug";
  }
  if (intDayOfWeek == 5) {
    today = "Fimmtudagur";
    tomorrow = "Föst";
    dayAfterTomorrow = "Laug";
    dayAfterTheDayAfterTomorrow = "Sun";
  }
  if (intDayOfWeek == 6) {
    today = "Föstudagur";
    tomorrow = "Laug";
    dayAfterTomorrow = "Sun";
    dayAfterTheDayAfterTomorrow = "Mán";
  }
  if (intDayOfWeek == 7) {
    today = "Laugardagur";
    tomorrow = "Sun";
    dayAfterTomorrow = "Mán";
    dayAfterTheDayAfterTomorrow = "Þrið";
  }
  
  textSize(60);
  text(today, leftPositions, dayheight);
  
  textSize(20);
  // Next three days for the weather display
  text(tomorrow, rightPositions, 280);
  text(dayAfterTomorrow, rightPositions, 305);
  text(dayAfterTheDayAfterTomorrow, rightPositions, 330);
  
  
  textSize(25);
   if(today == "Mánudagur"){
     text("Rækt kl 09 - FÆTUR",leftPositions,400);
     text("Vökva blómin í dag",leftPositions,430);
   }
   if(today == "Þriðjudagur"){
     text("Rækt kl 09 - HENDUR ",leftPositions,400);
   }
   if(today == "Miðvikudagur"){
     text("Rækt kl 09 - BAK",leftPositions,400);
     text("",leftPositions,430);
   }
   if(today == "Fimmtudagur"){
     text("Rækt kl 09 - BRJÓST",leftPositions,400);
     text("Pay Rent Today",leftPositions,430);
     text("Launch kl 13:00 ",leftPositions,460);
   }
   if(today == "Föstudagur"){
     text("Rækt kl 09 - FÆTUR",leftPositions,400);
     text("Vökva blómin",leftPositions,430);
     text("Launch kl 13:00 ",leftPositions,460);
   }
   if(today == "Laugardagur"){
     text("Gerðu hobbyið þitt",leftPositions,400);
   }
   if(today == "Sunnudagur"){
     text("Gerðu hobbyið þitt",leftPositions,400);
   } 
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void months() {
  int dateHeight = 250;
  String Month = "wrong month"; // Needs to be initialized, if this month is displayd something is wrong
  
  if (month() == 1) { Month = "janúar"; }
  if (month() == 2) { Month = "febrúar"; }
  if (month() == 3) { Month = "mars"; }
  if (month() == 4) { Month = "apríl"; }
  if (month() == 5) { Month = "maí";}
  if (month() == 6) { Month = "júní"; }
  if (month() == 7) { Month = "júlí"; }
  if (month() == 8) { Month = "ágúst"; }
  if (month() == 9) { Month = "september"; }
  if (month() == 10) { Month = "október"; }
  if (month() == 11) { Month = "nóvember"; }
  if (month() == 12) { Month = "desember"; }
  
  textSize(40);
  text(day()+". "+ Month + " " + year(), leftPositions, dateHeight);
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
void sunRiseAndSet() {
String url = "http://api.sunrise-sunset.org/json?lat=64.123658&lng=-21.928053&date=today";

JSONObject json = loadJSONObject(url);
JSONObject results = json.getJSONObject("results");
String sunrise = results.getString("sunrise");
String sunset = results.getString("sunset");
String dayLength = results.getString("day_length");

//println(sunrise);
//println(sunset);
//println(dayLength);

textSize(20);
text("Sólarupprás      " + sunrise, rightPositions, 200);
text("Sólsetur            " + sunset, rightPositions, 225);
//text("Lengd dags       " + dayLength, rightPositions, 250); 
}