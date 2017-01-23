JSONObject json = loadJSONObject("http://apis.is/petrol?");
JSONArray results = json.getJSONArray("results");
  
  
  JSONObject eachLoctiton = results.getJSONObject(9); 

float bensin95 = eachLoctiton.getFloat("bensin95");
float bensin95_discount = eachLoctiton.getFloat("bensin95_discount");
float diesel = eachLoctiton.getFloat("diesel");
float diesel_discount = eachLoctiton.getFloat("diesel_discount");
String name = eachLoctiton.getString("name");

println(name + ", " + bensin95 + ", " + bensin95_discount + ", " + diesel);