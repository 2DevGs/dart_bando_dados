import 'package:mysql1/mysql1.dart';

class Database {

  Future<MySqlConnection> openConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'USER',
      password: 'PASSWORD',
      db: 'dart_mysql'
    );
    return MySqlConnection.connect(settings);
  }
}