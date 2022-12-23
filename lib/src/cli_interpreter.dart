
import 'package:flutter/cupertino.dart';

abstract class CLIInterpreter {
  Function(Widget) _sink= cliDefaultSink;

  // CLIInterpreter(this._sink);
  set sink(Function(Widget) sink) => _sink = sink;

  void execute(String command);
}
cliDefaultSink(Widget widget) => debugPrint('Unimplemented CLIInterpreter: $widget');

class UnImplementedCLIInterpreter extends CLIInterpreter {
  UnImplementedCLIInterpreter();
  @override
  void execute(String command) {
    _sink(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


