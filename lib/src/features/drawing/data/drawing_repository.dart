import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:master_source_flutter/src/tables/character_path_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/api/drawing_api.dart';
import 'package:master_source_flutter/src/constants/color_extensions.dart';
import 'package:master_source_flutter/src/exceptions/drawing_exceptions.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_background.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';

part 'drawing_repository.g.dart';

abstract class DrawingRepositoryImpl {
  Future<CharacterDraw> fetchCharacterDrawing();
  Future<void> addImageCanvas(Map<String, dynamic> data);
  Future<void> updateImageCanvas(Map<String, dynamic> data);
  Future<Map<String, Uint8List>?> getImageCanvas(String idCharacter);
}

class HttpDrawingRepository implements DrawingRepositoryImpl {
  final DrawingAPI api;
  final http.Client client;

  HttpDrawingRepository({required this.api, required this.client});

  @override
  Future<CharacterDraw> fetchCharacterDrawing() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/character-dummy.json');
      final data = await json.decode(response);

      final normalizeData = {
        'id': '0',
        'characterDrawPaths': (data as List)
            .map(
              (data) => {
                'id': data['id'],
                'characterPath': data['attributes']['d'],
                'fill': data['style'] == 'fill'
                    ? data['strokeColor']
                    : data['strokeColor'] != null
                        ? Colors.white.value
                        : null,
                'stroke': data['style'] == 'stroke'
                    ? {
                        'widthStroke': 3,
                        'color': HexColor.fromHex('#231F20').value,
                      }
                    : null
              },
            )
            .toList(),
      };

      return CharacterDraw.fromJson(normalizeData);
    } on DrawingException catch (err) {
      debugPrint(err.toString());
    } catch (err) {
      debugPrint(err.toString());
    } finally {
      client.close();
    }

    return const CharacterDraw(
      id: '0',
      backgroundDrawPaths: CharacterDrawBackground(),
    );
  }

  @override
  Future<Map<String, Uint8List>?> getImageCanvas(String idCharacter) async {
    try {
      final characterPathTable = CharacterPathTable();
      final images =
          await characterPathTable.queryRowsByIdCharacter(idCharacter);

      if (images != null) {
        final Map<String, Uint8List> temp = {};

        images.forEach((image) {
          temp.addEntries({
            image["id_draw_path"] as String: image["image"] as Uint8List,
          }.entries);
        });

        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  @override
  Future<void> addImageCanvas(Map<String, dynamic> data) async {
    try {
      final characterPathTable = CharacterPathTable();

      await characterPathTable.insert(data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> updateImageCanvas(Map<String, dynamic> data) async {
    try {
      final characterPathTable = CharacterPathTable();

      await characterPathTable.update(data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

@riverpod
HttpDrawingRepository drawingRepository(DrawingRepositoryRef ref) {
  return HttpDrawingRepository(
    api: DrawingAPI(),
    client: http.Client(),
  );
}
