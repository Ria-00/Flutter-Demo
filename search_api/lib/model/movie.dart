class Movie{
  String type='';
  String title='';
  int year=0;
  List<dynamic> genres=[];
  List<dynamic> cast=[];
  List<dynamic> directors=[];
  String overview='';

  Movie();

  Movie.fromJson(Map<String,dynamic> data){
    title=data['result'][0]['title'];
    type=data['result'][0]['type'];
    year=data['result'][0]['year'];
    // cast=data['result'][0]["cast"];
    genres=data['result'][0]['genres'];
    directors=data['result'][0]['directors'];
    overview=data['result'][0]['overview'];
  }

}