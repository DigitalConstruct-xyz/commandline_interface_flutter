import 'package:flutter/material.dart';
import '../lib/src/cli_controller.dart';
import '../lib/src/cli_interpreter.dart';
import '../lib/src/cli_interface.dart';

class ExampleInterpreter extends CLIInterpreter {
  ExampleInterpreter();
  @override
  void execute(String command) {
    sink(
      Container(child: Text('\$input: $command', style: TextStyle(color: Colors.greenAccent),))
    );
    sink(
      Container(child: Text('output >>  $command'))
    );
  }
}
final CLIInterpreter exampleInterpreter = ExampleInterpreter();
final CLIController cliBehaviorSubject = CLIController(
  init_interpreter: exampleInterpreter,
);
final CLIInterface commandLineInterface = CLIInterface(cliBehaviorSubject);
// CLIInterpreter > CLIBehaviorSubject > CommandLineInterface

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimalist Flutter Template',
      theme: ThemeData.dark(),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommandLine Interface'),
      ),
      body: commandLineInterface,
    );
  }
}