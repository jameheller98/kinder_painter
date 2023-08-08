import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:master_source_flutter/src/constants/color_extensions.dart';
import 'package:master_source_flutter/src/exceptions/drawing_exceptions.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_background.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/api/common_api.dart';

import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';

part 'drawing_repository.g.dart';

abstract class DrawingRepositoryImpl {
  Future<CharacterDraw> fetchCharacterDrawing();
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
}

@riverpod
HttpDrawingRepository drawingRepository(DrawingRepositoryRef ref) {
  return HttpDrawingRepository(api: DrawingAPI(), client: http.Client());
}
