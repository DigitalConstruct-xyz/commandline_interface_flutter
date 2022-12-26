import 'package:flutter/cupertino.dart';

abstract class CLIManagerBase {
  Function(Widget) sink= cliDefaultSink;
  void Function() clear = cliDefaultClear;
  void execute(String command);
}
cliDefaultSink(Widget widget) => debugPrint('Unimplemented CLIInterpreter: $widget');
cliDefaultClear() => debugPrint('Unimplemented CLIInterpreter: clear');

class UnImplementedCLIManager extends CLIManagerBase {
  UnImplementedCLIManager();
  @override
  void execute(String command) {
    sink(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


