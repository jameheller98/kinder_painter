import 'package:sqflite/sqflite.dart';

import 'package:master_source_flutter/src/config/database_config.dart';

class CommonTable {
  static const _table = 'common_table';
  static const _columnId = 'id';

  static String get createTableSQL =>
      'CREATE TABLE $_table($_columnId TEXT PRIMARY KEY)';

  Future<int> insert(Map<String, dynamic> row) async {
    return await dbConfig.db.insert(_table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await dbConfig.db.query(_table);
  }

  Future<int> queryRowCount() async {
    final results = await dbConfig.db.rawQuery('SELECT COUNT(*) FROM $_table');

    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row[_columnId];

    return await dbConfig.db.update(
      _table,
      row,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(String id) async {
    return await dbConfig.db.delete(
      _table,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }
}
