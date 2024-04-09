import 'dart:convert';

import 'package:search_api/model/movie.dart';
import 'package:http/http.dart' as http;

class Helper{
  
  final String auth="streaming-availability.p.rapidapi.com";
  final String path='search/title';
  final String apiKey='09cb3dbb1cmsh09bf36e51f75909p162005jsn38d929668579';

  Future<Movie> getMovie(String title,String country,String lang) async{

    final headers={
      'X-RapidAPI-Key':apiKey,
      'X-RapidAPI-Host':auth
    };

    Map<String,dynamic> param={
      'title':title,
      'country':country,
      'output_language':lang

    };

    Map<String,dynamic> data={};

    try {
      final url=Uri.https(auth,path,param);
      http.Response res=await http.get(url,headers: headers);
      data=jsonDecode(res.body);
      
    } catch (e) {
      print(e);
    }

    Movie m=Movie.fromJson(data);
    print(m.cast);
    return m;
  }

}

void main(){
  Helper h=Helper();
  h.getMovie('Barbie', 'us', 'en');

}
  
