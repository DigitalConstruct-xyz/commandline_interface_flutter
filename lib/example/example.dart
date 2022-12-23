import 'package:flutter/material.dart';
import '../src/cli_behaviorsubject.dart';
import '../src/cli_interpreter.dart';
import '../src/commandline_interface.dart';


//SET UP BEHAVIOR SUBJECT AND INTERPRETER
final CLIInterpreter cliInterpreter = UnImplementedCLIInterpreter();
final CLIBehaviorSubject cliBehaviorSubject = CLIBehaviorSubject(
  init_interpreter: cliInterpreter,
);

void main() {
  cliBehaviorSubject.interpreter = cliInterpreter;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimalist Flutter Template',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CLIBehaviorSubject subject;
  // MyHomePage() {
  //   _subject.interpreter = UnImplementedCLIInterpreter(_subject.addToDisplayFunction);
  // }
  MyHomePage({Key? key, CLIBehaviorSubject? subject}) : subject = subject ?? cliBehaviorSubject, super(key: key);
  @override
  Widget build(BuildContext context) {

    //set up a example interpreter

    return Scaffold(
      appBar: AppBar(
        title: Text('CommandLine Interface'),
      ),
      body: CommandLineInterface(subject),
    );
  }
}