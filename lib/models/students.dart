// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'address.dart';
import 'courses.dart';

class Students {
  int? id;
  String name;
  int? age;
  List<String> nameCourses;
  List<Courses> courses;
  Address address;
  Students({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((courses) => courses.toMap()).toList(),
      'address': address.toMap(),
    };
    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      nameCourses: List<String>.from(map['nameCourses']),
      courses: map['courses']
              ?.map<Courses>((courseMap) => Courses.fromMap(courseMap))
              .toList() ??
          <Courses>[],
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }
  factory Students.fromJson(String json) => Students.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Students(id: $id, name: $name)';
  }
}
