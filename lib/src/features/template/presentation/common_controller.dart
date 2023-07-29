import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/features/template/application/common_service.dart';
import 'package:master_source_flutter/src/features/template/domain/common.dart';

part 'common_controller.g.dart';

@riverpod
class CommonController extends _$CommonController {
  @override
  FutureOr<List<Common>> build() {
    return ref.read(commonServiceProvider.notifier).fetchCommon();
  }

  Future<void> addCommon() async {
    final newCommon = await AsyncValue.guard(
        () => ref.read(commonServiceProvider.notifier).addCommon());

    state = AsyncData([...state.requireValue, newCommon.requireValue]);
  }

  Future<void> deleteCommon(Common common) async {
    await AsyncValue.guard(
        () => ref.read(commonServiceProvider.notifier).deleteCommon(common));

    state = AsyncData(
        state.requireValue.where((itm) => itm.id != common.id).toList());
  }
}
