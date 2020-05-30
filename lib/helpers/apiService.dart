import "package:http/http.dart";

class tmdbApi {
  final String apiKey = "b73e2111629b6ae279e4b542b5396a54" ;
  final String topMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=" + apiKey+ "&language=en-US&page=1";
  List<dynamic> topMovies() async{
    Responce res = await get(topMoviesURL);

    if(res.statusCode == 200){
      List<dynamic> results = jsonDecode(res.body)['results'];
      List<dynamic> MovieInfo = [];
      for(var i = 0; i < results.length; i++ ){
        var currMovie = results[i]
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
  }


}