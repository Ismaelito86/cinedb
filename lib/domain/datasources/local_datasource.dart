import 'package:cinedb/domain/entities/movie.dart';
import 'package:cinedb/domain/entities/profile.dart';

abstract class LocalDatasource {
  Future<void> favorite(Movie movie);

  Future<bool> isFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});

  Future<void> addMovies(List<Movie> movies);

  Future<Profile?> loadProfile();

  Future<void> updateProfile(Profile profile);
}
