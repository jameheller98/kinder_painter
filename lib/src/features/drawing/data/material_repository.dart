import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/api/material_api.dart';
import 'package:master_source_flutter/src/exceptions/material_exceptions.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart'
    as material;

part 'material_repository.g.dart';

abstract class MaterialRepositoryImpl {
  Future<List<material.Material>> fetchMaterials();
}

class HttpMaterialRepository implements MaterialRepositoryImpl {
  final MaterialAPI api;
  final http.Client client;

  HttpMaterialRepository({required this.api, required this.client});

  @override
  Future<List<material.Material>> fetchMaterials() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/topic-material-dummy.json');
      final data = await json.decode(response);

      return (data as List)
          .map(
            (materialData) => material.Material.fromJson(materialData),
          )
          .toList();
    } on MaterialException catch (err) {
      debugPrint(err.toString());
    } catch (err) {
      debugPrint(err.toString());
    } finally {
      client.close();
    }

    return [];
  }
}

@riverpod
HttpMaterialRepository materialRepository(MaterialRepositoryRef ref) {
  return HttpMaterialRepository(
    api: MaterialAPI(),
    client: http.Client(),
  );
}
