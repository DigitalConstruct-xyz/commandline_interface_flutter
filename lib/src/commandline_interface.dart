import 'package:flutter/material.dart';

import 'cli_behaviorsubject.dart';
import 'cli_display.dart';
import 'cli_textfield.dart';

class CommandLineInterface extends StatelessWidget{
  // final CLIInterpreter _interpreter;
  final CLIBehaviorSubject _subject;
  CommandLineInterface(this._subject);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: cliDisplayBuilder(_subject.stream)),
        cliTextFieldBuilder(_subject.input),
      ]
    );
  }
}