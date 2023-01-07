import 'package:commandline_interface/commandline_interface.dart';
import 'package:flutter/material.dart';

class ExampleManager extends CLIManagerBase {
  ExampleManager();
  @override
  void execute(String command) {
    if(command == 'clear'){
      //clears the screen
      clear();
      //METHOD clear IS SET IN CONSTRUCTOR OF CLIController IN setter of manager
      //it uses clear function of CLIController
    } else {
      //USE function SINK TO ADD WIDGETS TO DISPLAY
      //METHOD SINK IS SET IN CONSTRUCTOR OF CLIController IN setter of manager
      //it uses addToDisplayFunction of CLIController
      sink(
          Container(child: Text('INPUT: $command', style: TextStyle(color: Colors.greenAccent),))
      );
      sink(
          Container(child: Text('OUTPUT: the user has entered "$command"'))
      );
      //ADD TEXT TO TEXT FIELD
      textFieldSink(command.toUpperCase());
    }
  }
}

// use cliWidgetGenerator function to generate a CLIWidget
final CLIWidget cliWidget = cliWidgetGenerator(ExampleManager());

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
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommandLineInterface'),
      ),
      body: cliWidget,
    );
  }
}