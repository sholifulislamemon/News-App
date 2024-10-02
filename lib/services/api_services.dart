import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../modal/news_modal.dart';

class ApiServices{
 final all_news_api = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b6255c3c49fe4f94919cfc185417945e";
 final bracking_news_api= "https://newsapi.org/v2/top-headlines?country=us&apiKey=b6255c3c49fe4f94919cfc185417945e";

//================================ all news api intrigation  function=========================
 Future<List<New_model>> getAllNews () async{
  try{
   Response response = await  http.get(Uri.parse(all_news_api));
   if( response.statusCode == 200){
    Map<String,dynamic> json= jsonDecode(response.body);
    List<dynamic>body = json["articles"];
    List<New_model>articlesList =body.map((item) => New_model.fromJson(item)).toList();
    return articlesList;
   }else{
    throw( " no news found");
   }

  }catch(e){
   print(e.toString());
   throw e ;
  }

 }




 //================================ bracking news api intrigation  function=========================
 Future<List<New_model>> getbrakingNews () async {
  try {
   Response response = await http.get(Uri.parse(bracking_news_api));
   if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic>body = json["articles"];
    List<New_model>articlesList = body.map((item) => New_model.fromJson(item))
        .toList();
    return articlesList;
   } else {
    throw(" no news found");
   }
  } catch (e) {
   throw e;
  }
 }
}