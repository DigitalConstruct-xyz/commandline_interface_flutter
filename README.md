## Features
A CommandLineInterface for Flutter


## Getting started
add this to your pubspec.yaml
```yaml
    dependencies:
      commandline_interface:
        git:
            url: https://github.com/monki1/commandline_interface_flutter.git
            ref: main
```
    
run the example file in the example folder.



## Usage
CLIManagerBase > CLIController > CLIWidget
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
          //SINK IS SET IN CONSTRUCTOR OF CLIController IN setter of interpreter
          sink(
              Container(child: Text('\$input: $command', style: TextStyle(color: Colors.greenAccent),))
          );
          sink(
              Container(child: Text('output >>  $command'))
          );
        }
    
    
      }
    }
    final CLIManagerBase exampleManager = ExampleManager();
    final CLIController cliBehaviorSubject = CLIController(
      initManager: exampleManager,
    );
    final CLIWidget cliWidget = CLIWidget(cliBehaviorSubject);
    // CLIManagerBase > CLIController > CLIWidget
    

```
Add the cliWidget to your widget tree.
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