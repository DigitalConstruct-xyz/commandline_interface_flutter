## Features
- A Simple CLI widget for Flutter that
- can be implemented in 20 lines of code.


## Getting started
In your pubspec.yaml, under
`
dependencies:
`
add
```yaml
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
     - this is where you will implement the logic of your CLI
       - use `sink(Widget)` to add widget to the CLI
       - use `clear()` to clear the CLI
       - use `sinkTextField(String text)` to add text to the input text field
 - 2: Create an instance of the new class
 - 3: Add the instance to CLI Widget Generator
   - `CLIWidget cli = CLIWidgetGenerator(CLIManagerBase: instance)`
 - 4: Add the CLIWidget instance to widget tree

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
      //METHOD clear IS SET IN CONSTRUCTOR OF CLIController IN setter of manager
      //it uses clear function of CLIController
    } else {
      //USE function SINK TO ADD WIDGETS TO DISPLAY
      //METHOD SINK IS SET IN CONSTRUCTOR OF CLIController IN setter of manager
      //it uses addToDisplayFunction of CLIController
      sink(
          Text('INPUT: $command', style: TextStyle(color: Colors.greenAccent),)
      );
      sink(
          Text('OUTPUT: the user has entered "$command"')
      );
      //ADD TEXT TO TEXT FIELD
      textFieldSink(command.toUpperCase());
    }
  }
}
```
 - step 2 + 3:
```dart
final CLIWidget cliWidget = cliWidgetGenerator(ExampleManager());
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
NOTE: the example above is functional. 
- It's a very basic example, but it shows the basic usage of the package.

## Additional information
InputDecoration for the TextField can be set in `lib/src/config.dart`
## License
MIT, see LICENSE file for details.
- If you use this package, please let me know, I would love to see what you made with it.
- If you have any questions, feel free to contact me.
- If you want to offer me a job, please email
```KXYE111@gmail.com``` asap, I need a job.
