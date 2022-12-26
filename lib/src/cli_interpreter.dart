import 'package:flutter/cupertino.dart';

abstract class CLIInterpreterMinimal {
  Function(Widget) sink= cliDefaultSink;
  void execute(String command);
}
cliDefaultSink(Widget widget) => debugPrint('Unimplemented CLIInterpreter: $widget');

class UnImplementedCLIInterpreter extends CLIInterpreterMinimal {
  UnImplementedCLIInterpreter();
  @override
  void execute(String command) {
    sink(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


