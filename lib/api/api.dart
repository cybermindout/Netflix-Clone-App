import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_ui/api/api_links.dart';

List<Map<String,dynamic>> popularMoviesList = [];
List<Map<String,dynamic>> trendingList = [];
List<Map<String,dynamic>> nowPlayingList = [];
List<Map<String,dynamic>> upcomingList = [];

List<Map<String,dynamic>> allMoviesList = [];

Future<void> getPopularMovies()async{
  final response = await http.get(Uri.parse(popular));
  if(response.statusCode == 200){
    var tempData = jsonDecode(response.body);
    List popularMovies = tempData['results'];
    // print(popularMovies);
    for(int i=0;i<popularMovies.length;i++){
      popularMoviesList.add({
        'title' : popularMovies[i]['title'],
        'backdrop_path' : popularMovies[i]['backdrop_path'],
        'overview' : popularMovies[i]['overview'],
        'vote_average' : popularMovies[i]['vote_average'],
        'release_date' : popularMovies[i]['release_date'],
        'poster_path' : popularMovies[i]['poster_path'],
      });
    }
  }else{
    throw Exception("error loading popular movies");
  }
}

Future<void> getTopRated()async{
  final response = await http.get(Uri.parse(topRated));
  if(response.statusCode == 200){
    var tempData = jsonDecode(response.body);
    List trendingMovies = tempData['results'];
    // print(trendingMovies);
    for(int i=0;i<trendingMovies.length;i++){
      trendingList.add({
        'title' : trendingMovies[i]['title'],
        'backdrop_path' : trendingMovies[i]['backdrop_path'],
        'overview' : trendingMovies[i]['overview'],
        'vote_average' : trendingMovies[i]['vote_average'],
        'release_date' : trendingMovies[i]['release_date'],
        'poster_path' : trendingMovies[i]['poster_path'],
      });
    }
  }else{
    throw Exception("error loading top rated movies");
  }
}

Future<void> getNowPlaying()async{
  final response = await http.get(Uri.parse(nowPlaying));
  if(response.statusCode == 200){
    var tempData = jsonDecode(response.body);
    List nowPlaying = tempData['results'];
    // print(nowPlaying);
    for(int i=0;i<nowPlaying.length;i++){
      nowPlayingList.add({
        'title' : nowPlaying[i]['title'],
        'backdrop_path' : nowPlaying[i]['backdrop_path'],
        'overview' : nowPlaying[i]['overview'],
        'vote_average' : nowPlaying[i]['vote_average'],
        'release_date' : nowPlaying[i]['release_date'],
        'poster_path' : nowPlaying[i]['poster_path'],
      });
    }
  }else{
    throw Exception("error loading movies");
  }
}

Future<void> getUpcoming()async{
  final response = await http.get(Uri.parse(upcoming));
  // print(response.statusCode);
  if(response.statusCode == 200){
    var tempData = jsonDecode(response.body);
    List upcomingL = tempData['results'];
    // print("upcoming : ${upcomingL}");
    for(int i=0;i<upcomingL.length;i++){
      upcomingList.add({
        'title' : upcomingL[i]['title'],
        'backdrop_path' : upcomingL[i]['backdrop_path'],
        'overview' : upcomingL[i]['overview'],
        'vote_average' : upcomingL[i]['vote_average'],
        'release_date' : upcomingL[i]['release_date'],
        'poster_path' : upcomingL[i]['poster_path'],
      });
    }
  }else{
    throw Exception("error loading upcoming movies");
  }
}

Future<void> getAllMovies()async{
  // print("all movies started");
  final response = await http.get(Uri.parse(allmovies));
  // print(response.statusCode);
  if(response.statusCode == 200){
    var tempData = jsonDecode(response.body);
    List allmoviesL = tempData['results'];
    // print("upcoming : ${allmoviesL}");
    for(int i=0;i<allmovies.length;i++){
      allMoviesList.add({
        'title' : allmoviesL[i]['original_name']??allmoviesL[i]["title"],
        'backdrop_path' : allmoviesL[i]['backdrop_path'],
        'overview' : allmoviesL[i]['overview'],
        'vote_average' : allmoviesL[i]['vote_average'],
        'release_date' : allmoviesL[i]['first_air_date'],
        'poster_path' : allmoviesL[i]['poster_path'],
      });
    }
  }else{
    throw Exception("error loading all movies");
  }
}