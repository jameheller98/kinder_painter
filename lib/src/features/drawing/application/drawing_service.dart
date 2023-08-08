import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:master_source_flutter/src/features/drawing/data/drawing_repository.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';

part 'drawing_service.g.dart';

const uuid = Uuid();

@riverpod
class DrawingService extends _$DrawingService {
  @override
  void build() {}

  Future<CharacterDraw> fetchDrawingCharacter() {
    return ref.read(drawingRepositoryProvider).fetchCharacterDrawing();
  }
}
