import 'package:get/get.dart';
import 'package:cinedb/domain/datasources/local_datasource.dart';
import 'package:cinedb/domain/repositories/local_repository.dart';
import 'package:cinedb/infrastructure/datasources/isar_local_datasource.dart';
import 'package:cinedb/infrastructure/repositories/local_repository_impl.dart';
import 'package:cinedb/infrastructure/service/network_service.dart';
import 'package:cinedb/infrastructure/service/networkconfig.dart';
import 'package:cinedb/domain/datasources/movies_datasource.dart';
import 'package:cinedb/domain/repositories/movies_repository.dart';
import 'package:cinedb/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinedb/infrastructure/repositories/movie_repository_impl.dart';

class DependencyInjection {
  static void init() async {
    // Data sources
    Get.put(DataConnectionChecker());
    Get.put(NetworkInfo(Get.find<DataConnectionChecker>()));

    Get.put<LocalDatasource>(IsarDatasource());
    Get.lazyPut<MoviesDatasource>(() => MovieDbDatasource(), fenix: true);

    // Repository
    Get.put<MoviesRepository>(
      MovieRepositoryImpl(
        Get.find<MoviesDatasource>(),
        Get.find<NetworkInfo>(),
        Get.find<LocalDatasource>(),
      ),
    );

    Get.put<LocalRepository>(LocalRepositoryImpl(Get.find<LocalDatasource>()));
  }
}
