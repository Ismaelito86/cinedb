import 'package:cinedb/domain/entities/movie.dart';
import 'package:cinedb/domain/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesProvider extends ChangeNotifier {
  final movieRepo = Get.find<MoviesRepository>();
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingMovies = [];

  int _page = 0;

  MoviesProvider() {
    initRemote();
  }
  initRemote() async => await Future.wait<dynamic>([
        getOnDisplayMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
        getUpcomingMovies(),
      ]);

  getOnDisplayMovies() async {
    _page++;
    final response = await movieRepo.getNowPlaying(page: _page);
    nowPlayingMovies.addAll(response);

    notifyListeners();
  }

  getPopularMovies() async {
    _page++;
    final response = await movieRepo.getPopular(page: _page);
    popularMovies.addAll(response);

    notifyListeners();
  }

  getTopRatedMovies() async {
    _page++;
    final response = await movieRepo.getTopRated(page: _page);
    topRatedMovies.addAll(response);

    notifyListeners();
  }

  getUpcomingMovies() async {
    _page++;
    final response = await movieRepo.getUpcoming(page: _page);
    upcomingMovies.addAll(response);

    notifyListeners();
  }
}
