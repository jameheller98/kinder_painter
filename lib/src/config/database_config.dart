import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:master_source_flutter/src/tables/character_path_table.dart';

class DatabaseConfig {
  static const _databaseName = "KinderPainter.db";
  static const _databaseVersion = 1;
  final List<String> tablesCreateSQL;

  DatabaseConfig({
    required this.tablesCreateSQL,
  });

  late Database _db;
  late Database _dbCache;

  Database get db {
    return _db;
  }

  Database get dbCache {
    return _dbCache;
  }

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    // databaseFactory.deleteDatabase(path);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    for (final tableCreateSQL in tablesCreateSQL) {
      db.execute(tableCreateSQL);
    }
  }
}

final dbConfig = DatabaseConfig(
  tablesCreateSQL: [
    CharacterPathTable.createTableSQL
    // CommonTable.createTableSQL,
  ],
);
