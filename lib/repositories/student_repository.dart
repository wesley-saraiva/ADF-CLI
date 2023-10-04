import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/students.dart';

class StudentRepository {
  Future<List<Students>> findAll() async {
    final studentsResult =
        await http.get(Uri.parse("http://localhost:8082/students"));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }

    final studentData = jsonDecode(studentsResult.body) as List;

    return studentData.map<Students>((student) {
      return Students.fromMap(student);
    }).toList();
  }

  Future<Students> findById(int id) async {
    final studentResult =
        await http.get(Uri.parse("http://localhost:8082/students/$id"));
    if (studentResult.statusCode != 200) {
      throw Exception();
    }
    return Students.fromJson(studentResult.body);
  }

  Future<void> insert(Students students) async {
    final response = await http.post(
        Uri.parse("http://localhost:8082/students"),
        body: students.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(Students students) async {
    final response = await http.put(
        Uri.parse('http://localhost:8082/students/${students.id}'),
        body: students.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response =
        await http.delete(Uri.parse("http://localhost:8082/students/$id"));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
