import 'dart:io';

import 'package:args/command_runner.dart';
import '../../repositories/student_dio_repository.dart';
// import '../../repositories/student_repository.dart';

class DeleteCommand extends Command {
  final StudentDioRepository studentRepository;

  @override
  String get description => 'Delete Student';

  @override
  String get name => 'delete';

  DeleteCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }
  @override
  Future<void> run() async {
    final id = int.tryParse(argResults?['id']);

    if (id == null) {
      print('Por favor informe o id do aluno');
      return;
    }

    print('Aguarde');

    final student = await studentRepository.findById(id);

    print('Confrima a exclusao do aluno ${student.name} ? (S ou N)');

    final confrimDelete = stdin.readLineSync();

    if (confrimDelete?.toLowerCase() == 's') {
      await studentRepository.deleteById(id);
      print('--------------------');
      print('Aluno Deletado com sucesso');
      print('----------------------------');
    } else {
      print('----------------------------');
      print('operacao cancelada');
      print('----------------------------');
    }
  }
}
