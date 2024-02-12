import 'package:cinedb/domain/entities/movie.dart';
import 'package:cinedb/domain/entities/profile.dart';

abstract class LocalRepository {
  Future<void> favorite(Movie movie);

  Future<bool> isFavorite(int movieId);
  Future<Profile?> loadProfile();

  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});

  Future<void> updateProfile(Profile profile);
}
