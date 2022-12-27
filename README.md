## Features
- A Simple CLI widget for Flutter that
- can be implemented in LESS THAN 20 LINES of extra code.


## Getting started
add this to your pubspec.yaml, then run `pub get`:
```yaml
dependencies:
  commandline_interface:
    git:
        url: https://github.com/monki1/commandline_interface_flutter.git
        ref: main
```
NOTE: This package is also available on pub.dev, but it is not recommended to use it, as it is not updated as often as the GitHub version.
    




## Usage
Steps:
 - 1: Create a new class that extends the CLIManagerBase class
   - override the `execute(String command)` method
     - use `sink` to add WIDGET to the CLI
     - use `clear()` to clear the CLI
 - 2: Create then Add an instance of the new class to the CLIController constructor
 - 3: Add the CLIController instance to CLIWidget constructor
 - 4: Add the CLIWidget instance to widget tree

  Structure:  CLIManagerBase > CLIController > CLIWidget > MaterialApp

 - step 1:
```dart
import 'package:commandline_interface/commandline_interface.dart';
import 'package:flutter/material.dart';

class ExampleManager extends CLIManagerBase {
  ExampleManager();
  @override
  void execute(String command) {
    if(command == 'clear'){
      //clears the screen
      clear();
    } else {
      //USE function SINK TO ADD WIDGETS TO DISPLAY
      //METHOD SINK IS SET IN CONSTRUCTOR OF CLIController IN setter of interpreter
      sink(
          Container(child: Text('\$input: $command', style: TextStyle(color: Colors.greenAccent),))
      );
      sink(
          Container(child: Text('output >>  $command'))
      );
    }
  }
}
```
 - step 2 & 3:
```dart
final CLIManagerBase exampleManager = ExampleManager();
final CLIController cliBehaviorSubject = CLIController(initManager: exampleManager);
final CLIWidget cliWidget = CLIWidget(cliBehaviorSubject);
// CLIManagerBase > CLIController > CLIWidget
```
 - step 4:  Add the cliWidget to your widget tree.
```dart
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
        title: Text('CommandLineInterface'),
      ),
      body: cliWidget,
    );
  }
}
```

## Additional information

## License
    MIT