import 'package:cinedb/domain/entities/movie.dart';
import 'package:cinedb/domain/datasources/local_datasource.dart';
import 'package:cinedb/domain/entities/profile.dart';
import 'package:cinedb/domain/repositories/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final LocalDatasource datasource;

  LocalRepositoryImpl(this.datasource);

  @override
  Future<bool> isFavorite(int movieId) {
    return datasource.isFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> favorite(Movie movie) {
    return datasource.favorite(movie);
  }

  @override
  Future<Profile?> loadProfile() {
    return datasource.loadProfile();
  }

  @override
  Future<void> updateProfile(Profile profile) {
    return datasource.updateProfile(profile);
  }
}
