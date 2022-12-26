[//]: # ADD CLI Commands: clear, esc



## Features
A CommandLine Interface widget that takes in a class CLIInterpreter Object.

## Getting started
// CLIInterpreter > CLIBehaviorSubject > CommandLineInterface
Make ^ a CLIInterpreter object and pass it to the CLIBehaviorSubject constructor.
Then pass the CLIBehaviorSubject object to the CommandLineInterface constructor.



## Usage
CLIInterpreter > CLIController > CLIInterface
```
import 'package:commandline_interface/commandline_interface.dart';
import 'package:flutter/material.dart';


class ExampleInterpreter extends CLIInterpreterMinimal {
  ExampleInterpreter();
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
final CLIInterpreterMinimal exampleInterpreter = ExampleInterpreter();
final CLIController cliBehaviorSubject = CLIController(
  init_interpreter: exampleInterpreter,
);
final CLIInterface commandLineInterface = CLIInterface(cliBehaviorSubject);
// CLIInterpreterMinimal > CLIController > CLIInterface

```
Add the commandLineInterface to your widget tree.
```
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
```

## Additional information

## License
    MIT