// import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

import '../models/students.dart';

class StudentDioRepository {
  Future<List<Students>> findAll() async {
    // final studentsResult =
    //     await http.get(Uri.parse("http://localhost:8082/students"));

    // if (studentsResult.statusCode != 200) {
    //   throw Exception();
    // }

    // final studentData = jsonDecode(studentsResult.body) as List;
    try {
      final studentsResult = await Dio().get('http://localhost:8082/students');

      return studentsResult.data.map<Students>((student) {
        return Students.fromMap(student);
      }).toList();
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<Students> findById(int id) async {
    // final studentResult =
    //     await http.get(Uri.parse("http://localhost:8082/students/$id"));
    // if (studentResult.statusCode != 200) {
    //   throw Exception();
    // }
    try {
      final studnetResult =
          await Dio().get('http://localhost:8082/students/$id');

      if (studnetResult.data == null) {
        throw Exception();
      }

      return Students.fromMap(studnetResult.data);
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> insert(Students students) async {
    // final response = await http.post(
    //     Uri.parse("http://localhost:8082/students"),
    //     body: students.toJson(),
    //     headers: {'content-type': 'application/json'});

    // if (response.statusCode != 200) {
    //   throw Exception();
    // }
    try {
      await Dio().post(
        'http://localhost:8082/students',
        data: students.toMap(),
      );
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> update(Students students) async {
    // final response = await http.put(
    //     Uri.parse('http://localhost:8082/students/${students.id}'),
    //     body: students.toJson(),
    //     headers: {'content-type': 'application/json'});

    // if (response.statusCode != 200) {
    //   throw Exception();
    // }
    try {
      await Dio().put(
        'http://localhost:8082/students/${students.id}',
        data: students.toMap(),
      );
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    // final response =
    //     await http.delete(Uri.parse("http://localhost:8082/students/$id"));
    // if (response.statusCode != 200) {
    //   throw Exception();
    // }
    try {
      await Dio().delete('http://localhost:8082/students/$id');
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }
}
