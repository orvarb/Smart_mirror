JSONObject json = loadJSONObject("http://apis.is/weather/forecasts/is?stations=1");
JSONArray results = json.getJSONArray("results");
JSONObject temperatureAtNoon = results.getJSONObject(0); 
JSONArray forecast = temperatureAtNoon.getJSONArray("forecast");

// Find temperature for noon next day
JSONObject temperature1 = forecast.getJSONObject(12);
String temp1 = temperature1.getString("T");
String tempTime1 = temperature1.getString("ftime");
String description1 = temperature1.getString("W");
println("Time: " + tempTime1);
println("Temperature: " + temp1);
println("Description: " + description1);

// Find temperature for noon day after tomorrow
JSONObject temperature2 = forecast.getJSONObject(36);
String temp2 = temperature2.getString("T");
String tempTime2 = temperature2.getString("ftime");
String description2 = temperature2.getString("W");
println("Time: " + tempTime2);
println("Temperature: " + temp2);
println("Description: " + description2);

// Find temperature for noon day after tomorrow
JSONObject temperature3 = forecast.getJSONObject(60);
String temp3 = temperature3.getString("T");
String tempTime3 = temperature3.getString("ftime");
String description3 = temperature3.getString("W");
println("Time: " + tempTime3);
println("Temperature: " + temp3);
println("Description: " + description3);