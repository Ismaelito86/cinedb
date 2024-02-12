import 'package:cinedb/infrastructure/service/networkconfig.dart';

class NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
