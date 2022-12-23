import 'package:flutter/material.dart';
import '../src/cli_behaviorsubject.dart';
import '../src/cli_interpreter.dart';
import '../src/commandline_interface.dart';


//SET UP BEHAVIOR SUBJECT AND INTERPRETER


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
final CLIBehaviorSubject cliBehaviorSubject = CLIBehaviorSubject(
  init_interpreter: exampleInterpreter,
);
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
      body: CommandLineInterface(cliBehaviorSubject),
    );
  }
}