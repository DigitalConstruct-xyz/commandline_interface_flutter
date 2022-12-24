import 'package:flutter/material.dart';

import 'cli_controller.dart';
import 'cli_display.dart';
import 'cli_textfield.dart';

class CLIInterface extends StatelessWidget{
  // final CLIInterpreter _interpreter;
  final CLIController _subject;
  CLIInterface(this._subject);

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