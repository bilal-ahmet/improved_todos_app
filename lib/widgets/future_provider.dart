import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/models/cat_facts_model.dart';

final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "https://catfact.ninja/"));
});

final catFactProvider =
    FutureProvider.autoDispose.family<List<CatFactsModel>, Map<String, dynamic>>(
        (ref, parametreMapi) async {
  final _dio = ref.watch(httpClientProvider);
  final _result =
      await _dio.get("facts", queryParameters: {"limit": parametreMapi});

      // bilgileri hafızada tutmayı sağlıyor
      //ref.keepAlive();
  List<Map<String, dynamic>> _mapData = List.from(_result.data["data"]);
  List<CatFactsModel> _catFactsList =
      _mapData.map((e) => CatFactsModel.fromMap(e)).toList();
  return _catFactsList;
});

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste =
        ref.watch(catFactProvider(const {"limit": 2, "max_lenght": 30}));

    return Scaffold(
      body: SafeArea(
          child: _liste.when(
        data: (liste) {
          return ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(liste[index].fact),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text("hata çıktı $error"),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
