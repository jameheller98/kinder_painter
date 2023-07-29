import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:master_source_flutter/src/features/template/domain/common.dart';
import 'package:master_source_flutter/src/features/template/data/common_repository.dart';

part 'common_service.g.dart';

const uuid = Uuid();

@riverpod
class CommonService extends _$CommonService {
  @override
  void build() {}

  Future<List<Common>> fetchCommon() {
    return ref.read(commonRepositoryProvider).fetchCommons();
  }

  Future<Common> addCommon() async {
    final newCommon = Common(
      id: uuid.v4(),
    );

    await ref.read(commonRepositoryProvider).addCommon(newCommon);

    return newCommon;
  }

  Future<void> deleteCommon(Common common) async {
    await ref.read(commonRepositoryProvider).deleteCommon(common);
  }
}
