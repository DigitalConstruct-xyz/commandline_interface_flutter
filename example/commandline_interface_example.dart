import 'package:commandline_interface/commandline_interface.dart';
import 'package:flutter/material.dart';


class ExampleManager extends CLIManagerBase {
  ExampleManager();
  @override
  void execute(String command) {
    //USE function SINK TO ADD WIDGETS TO DISPLAY
    //SINK IS SET IN CONSTRUCTOR OF CLIController IN setter of interpreter
    sink(
      Container(child: Text('\$input: $command', style: TextStyle(color: Colors.greenAccent),))
    );
    sink(
      Container(child: Text('output >>  $command'))
    );
  }
}
final CLIManagerBase exampleManager = ExampleManager();
final CLIController cliBehaviorSubject = CLIController(
  initManager: exampleManager,
);
final CLIWidget commandLineInterface = CLIWidget(cliBehaviorSubject);
// CLIInterpreterMinimal > CLIController > CLIInterface

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