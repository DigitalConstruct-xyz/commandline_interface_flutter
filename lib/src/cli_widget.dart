import 'package:flutter/material.dart';
import 'cli_display_controller.dart';
import 'cli_display.dart';
import 'super_textfield.dart';
import 'cli_textfield_controller.dart';

class CLIWidget extends StatelessWidget {
  // final CLIInterpreter _interpreter;
  final CLIDisplayController _displayController;
  final CLITextFieldController _textFieldController;
  final ScrollController _scrollController;
  CLIWidget(this._displayController, this._textFieldController, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Expanded(child: cliDisplayBuilder(_displayController.stream, _scrollController),),
      // Expanded(child:
      superTextFieldFactory(
          _textFieldController.submitStream,
          _textFieldController.autoFillStream,
          _textFieldController.onChangedStream,
          _textFieldController.focusNode),
      // ),
    ]);
  }
}
