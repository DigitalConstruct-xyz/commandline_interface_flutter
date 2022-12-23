
import 'package:flutter/cupertino.dart';

abstract class CLIInterpreter {
  Function(Widget) sink= cliDefaultSink;

  // CLIInterpreter(this._sink);
  // setSink(Function(Widget) s){sink = s;}

  void execute(String command);
}
cliDefaultSink(Widget widget) => debugPrint('Unimplemented CLIInterpreter: $widget');

class UnImplementedCLIInterpreter extends CLIInterpreter {
  UnImplementedCLIInterpreter();
  @override
  void execute(String command) {
    sink(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


