import 'package:cinedb/domain/datasources/local_datasource.dart';
import 'package:cinedb/domain/datasources/movies_datasource.dart';
import 'package:cinedb/domain/entities/movie.dart';
import 'package:cinedb/domain/repositories/movies_repository.dart';
import 'package:cinedb/infrastructure/service/network_service.dart';

// ignore: prefer_generic_function_type_aliases
typedef Future<List<Movie>> _GetMovies();

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  final LocalDatasource localStorageDatasource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(
      this.datasource, this.networkInfo, this.localStorageDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _getMovies(() => datasource.getNowPlaying(page: page));
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _getMovies(() => datasource.getPopular(page: page));
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _getMovies(() => datasource.getTopRated(page: page));
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _getMovies(() => datasource.getUpcoming(page: page));
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return _getMovies(() => datasource.searchMovies(query));
  }

  // ignore: unused_element
  Future<List<Movie>> _getMovies(_GetMovies getMovies) async {
    final bool network = await networkInfo.isConnected;

    if (network) {
      try {
        final remoteResponse = await getMovies();
        await localStorageDatasource.addMovies(remoteResponse);
        return remoteResponse;
      } catch (e) {
        return [];
      }
    } else {
      try {
        final localMovies = await localStorageDatasource.loadMovies();
        return localMovies;
      } catch (e) {
        return [];
      }
    }
  }
}
