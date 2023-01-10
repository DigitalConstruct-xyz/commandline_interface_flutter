import 'package:flutter/cupertino.dart';

abstract class CLIManagerBase {
  Function(Widget) addWidgetToScreen= cliDefault_add_to_screen;
  //get widgets on screen
  Function getWidgetsOnScreen = cliDefault_add_to_screen;
  Function(List<Widget> widgets) setWidgetsOnScreen = cliDefaultSetWidgetsOnScreen;
  //set widgets on screen
  Function(String) addTextToInputField = cliDefaultTextFieldSink;
  //onChanged 
  Function(String) inputFieldOnChanged = cliDefaultInputFieldOnChanged;
  void Function() clear = cliDefaultClear;
  void execute(String command);
}
cliDefault_add_to_screen(Widget widget) => debugPrint('Unimplemented: $widget');
cliDefaultClear() => debugPrint('Unimplemented: clear');
cliDefaultTextFieldSink(String s) => debugPrint('Unimplemented: $s');
cliDefaultInputFieldOnChanged(String s) => debugPrint('Unimplemented: $s');
cliDefaultGetWidgetsOnScreen() => debugPrint('Unimplemented: getWidgetsOnScreen');
cliDefaultSetWidgetsOnScreen(List<Widget> widgets) => debugPrint('Unimplemented: setWidgetsOnScreen');

class UnImplementedCLIManager extends CLIManagerBase {
  UnImplementedCLIManager();
  @override
  void execute(String command) {
    addWidgetToScreen(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


