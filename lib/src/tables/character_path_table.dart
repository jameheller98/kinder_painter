import 'package:master_source_flutter/src/config/database_config.dart';

class CharacterPathTable {
  static const _table = 'character_path_table';
  static const _columnId = 'id';
  static const _columnIdCharacter = 'id_character';
  static const _columnIdDrawPath = 'id_draw_path';
  static const _columnImage = 'image';

  static String get createTableSQL =>
      'CREATE TABLE $_table($_columnId INTEGER PRIMARY KEY, $_columnIdCharacter TEXT, $_columnIdDrawPath TEXT, $_columnImage BLOB)';

  Future<int> insert(Map<String, dynamic> row) async {
    return await dbConfig.db.insert(_table, row);
  }

  Future<List<Map<String, dynamic>>?> queryRowsByIdCharacter(
      String idCharacter) async {
    List<Map<String, dynamic>> listData = await dbConfig.db.query(
      _table,
      where: '$_columnIdCharacter = ?',
      whereArgs: [idCharacter],
    );

    if (listData.isNotEmpty) {
      return listData;
    }

    return null;
  }

  Future<int> update(Map<String, dynamic> row) async {
    String idCharacter = row[_columnIdCharacter];
    String idDrawPath = row[_columnIdDrawPath];

    return await dbConfig.db.update(
      _table,
      row,
      where: '$_columnIdCharacter = ? AND $_columnIdDrawPath = ?',
      whereArgs: [idCharacter, idDrawPath],
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
