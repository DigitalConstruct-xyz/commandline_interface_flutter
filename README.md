## Features
A Simple CLI for Flutter.
Can be implemented in less than 20 lines of extra code.


## Getting started
add this to your pubspec.yaml, then run `pub get`:
```yaml
    dependencies:
      commandline_interface:
        git:
            url: https://github.com/monki1/commandline_interface_flutter.git
            ref: main
```
    




## Usage
 - 1 Create a new class that extends the CLIManagerBase class
 - 2 Create then Add an instance of your class to the CLIController constructor
 - 3 Add the CLIController instance to CLIWidget constructor
 - 4 Add the CLIWidget to widget tree
CLIManagerBase > CLIController > CLIWidget

 - 1 
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
 - 2 & 3
```dart
    final CLIManagerBase exampleManager = ExampleManager();
    final CLIController cliBehaviorSubject = CLIController(initManager: exampleManager);
    final CLIWidget cliWidget = CLIWidget(cliBehaviorSubject);
    // CLIManagerBase > CLIController > CLIWidget
```
 - 4 Add the cliWidget to your widget tree.
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