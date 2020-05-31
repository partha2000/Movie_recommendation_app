import 'dart:convert';

import "package:http/http.dart";

class TmdbApi {
  //String apiKey = "b73e2111629b6ae279e4b542b5396a54" ;
  final String topMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=b73e2111629b6ae279e4b542b5396a54&language=en-US&page=1";
  /*Future topMovies() async{
    Response res = await get(topMoviesURL);

    if(res.statusCode == 200){
      var results = json.decode(res.body)['results'];
      var MovieInfo = [];
      for(var i = 0; i < results.length; i++ ){
        var currMovie = results[i];
        var movie = {
            'title' : currMovie['title'],
            'id' : currMovie['id'],
            'ratings' : currMovie['vote_average'],
            'description' : currMovie['overview']
          };
        MovieInfo.add(movie);
      }

      return MovieInfo;
    }
    else{
      throw Exception("Failed to load data");
    }
   }*/

  Future topMovies() async{
    final data =
        await get(topMoviesURL);
        if (data.statusCode == 200) {
      return data.body;
    } else {
    throw Exception('Failed to load data');
    }
  }


}