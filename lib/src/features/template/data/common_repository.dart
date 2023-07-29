import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/api/common_api.dart';
import 'package:master_source_flutter/src/features/template/domain/common.dart';
import 'package:master_source_flutter/src/exceptions/common_exceptions.dart';
import 'package:master_source_flutter/src/tables/common_table.dart';

part 'common_repository.g.dart';

abstract class CommonRepositoryImpl {
  Future<List<Common>> fetchCommons();
  Future<void> addCommon(Common common);
  Future<void> deleteCommon(Common common);
}

class HttpCommonRepository implements CommonRepositoryImpl {
  final CommonAPI api;
  final http.Client client;

  HttpCommonRepository({required this.api, required this.client});

  @override
  Future<List<Common>> fetchCommons() async {
    try {
      // final response = await client.get(api.common('param'));

      // if (response.statusCode == 200) {
      //   final data = json.decode(response.body);

      //   await Future.delayed(const Duration(seconds: 3));

      //   return Common.fromJson(data);
      // }

      final commonTable = CommonTable();
      final commons = await commonTable.queryAllRows();

      return commons.map((common) => Common.fromJson(common)).toList();
    } on CommonException catch (_) {
      throw const CommonException('Something wrong in common feature');
    } finally {
      client.close();
    }
  }

  @override
  Future<void> addCommon(Common common) async {
    try {
      final commonTable = CommonTable();

      await commonTable.insert(common.toJson());
    } on CommonException catch (_) {
      throw const CommonException('Something wrong in common feature');
    } finally {
      client.close();
    }
  }

  @override
  Future<void> deleteCommon(Common common) async {
    try {
      final commonTable = CommonTable();

      await commonTable.delete(common.id);
    } on CommonException catch (_) {
      throw const CommonException('Something wrong in common feature');
    } finally {
      client.close();
    }
  }
}

@riverpod
HttpCommonRepository commonRepository(CommonRepositoryRef ref) {
  return HttpCommonRepository(api: CommonAPI(), client: http.Client());
}
