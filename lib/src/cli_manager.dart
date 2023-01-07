import 'package:flutter/cupertino.dart';

abstract class CLIManagerBase {
  Function(Widget) sink= cliDefaultSink;
  Function(String) textFieldSink = cliDefaultTextFieldSink;
  void Function() clear = cliDefaultClear;
  void execute(String command);
}
cliDefaultSink(Widget widget) => debugPrint('Unimplemented: $widget');
cliDefaultClear() => debugPrint('Unimplemented: clear');
cliDefaultTextFieldSink(String s) => debugPrint('Unimplemented: $s');

class UnImplementedCLIManager extends CLIManagerBase {
  UnImplementedCLIManager();
  @override
  void execute(String command) {
    sink(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


