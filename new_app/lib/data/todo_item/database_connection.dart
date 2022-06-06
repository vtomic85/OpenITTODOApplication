import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class DatabaseConnection {
  Database? _database;

  final String _databaseName = 'sembastTodo.db';
  final int _databaseVersion = 1;

  Future<Database> get db async {
    var directory;
    if (_database == null) {
      if (kIsWeb) {
        _database = await databaseFactoryWeb.openDatabase(_databaseName,
            version: _databaseVersion);
      } else {
        directory = await getApplicationSupportDirectory();
        final path = join(directory.path, _databaseName);
        _database = await databaseFactoryIo.openDatabase(path,
            version: _databaseVersion);
      }
    }
    return _database!;
  }
}
