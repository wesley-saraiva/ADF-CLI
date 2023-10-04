import 'dart:io';

import 'package:args/command_runner.dart';

import '../../repositories/student_dio_repository.dart';
// import '../../repositories/student_repository.dart';

class FindAllCommand extends Command {
  final StudentDioRepository repository;

  FindAllCommand(this.repository);

  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    print('Rodando o findAll');
    final students = await repository.findAll();
    print('Apresentar tambem os cursos?(S ou N)?');
    final showCourses = stdin.readLineSync();

    print('================================');
    print('Alunos');
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
