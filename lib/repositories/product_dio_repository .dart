// import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

import '../models/courses.dart';

class ProductDioRepository {
  Future<Courses> findByName(String name) async {
    // final response =
    //     await http.get(Uri.parse('http://localhost:8082/products?name=$name'));
    // if (response.statusCode != 200) {
    //   throw Exception();
    // }

    try {
      final response = await Dio().get(
        'http://localhost:8082/products',
        queryParameters: {
          'name': name,
        },
      );

      // final responseData = jsonDecode(response.body);

      if (response.data.isEmpty) {
        throw Exception('Produto não Encontrado');
      }

      return Courses.fromMap(response.data.first);
    } on DioException {
      throw Exception();
    }
  }
}
