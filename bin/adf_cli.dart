import 'package:adf_cli/commands/students/students_command.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
