import 'package:cinedb/domain/entities/profile.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import 'package:cinedb/domain/datasources/local_datasource.dart';
import 'package:cinedb/domain/entities/movie.dart';
import 'package:isar/isar.dart';

class IsarDatasource extends LocalDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([MovieSchema, ProfileSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final isar = await db;

    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> favorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      // Borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    // Insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> addMovies(List<Movie> movies) async {
    final isar = await db;

    return await isar.writeTxn(() => isar.movies.putAllById(movies));
  }

  @override
  Future<Profile?> loadProfile() async {
    final isar = await db;
    return await isar.profiles.where().findFirst();
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    final isar = await db;
    isar.writeTxn(() => isar.profiles.put(profile));
  }
}
