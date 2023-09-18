import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';
import '../subcommands/findById_command.dart';
import '../subcommands/find_all_command.dart';
import '../subcommands/insert_command.dart';
import '../subcommands/update_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(studentRepository));
    addSubcommand(FindByIdCommand(studentRepository));
    addSubcommand(InsertCommand(studentRepository));
    addSubcommand(UpdateCommand(studentRepository));
  }
}
