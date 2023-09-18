// ignore_for_file: file_names

import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  FindByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
    return;
  }

  @override
  String get description => 'Find Students By Id';

  @override
  String get name => 'byId';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Por favor envie o id do aluno com o comando --id=0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);

    print('Aguarde buscando dados...');
    final student = await studentRepository.findById(id);
    print('-------------------------------');
    print('Aluno ${student.name}:');
    print('-------------------------------');
    print('Nome ${student.name}:');
    print('Idade ${student.age ?? 'não informado'}:');
    print('Curso:');
    student.nameCourses.forEach(print);
    print('Endereco:');
    print('  ${student.address.street} ${student.address.zipCode}');
  }
}
