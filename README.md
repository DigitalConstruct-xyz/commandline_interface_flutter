
#### Functional, will not be updated
##### For a more flexible cli widget: https://github.com/monki1/command_line_interface_flutter

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
      - ### Methods avaliable in the class:
        - `addWidgetToScreen(widget: Widget)`: Adds a widget to the screen.
        - `removeWidgetFromScreen(widget: Widget)`: Removes a widget from the screen.
        - `getWidgetsOnScreen(): List<Widget>`: Gets the list of widgets currently on the screen.
        - `setWidgetsOnScreen(widgets: List<Widget>)`: Sets the widgets on the screen.
        - `addTextToInputField(text: String)`: Adds text to the input field.
        - `scroll(offset: double)`: Scrolls the display by a specified offset.
        - `inputFieldOnChanged(s: String)`: Handles changes in the input field.
        - `clear()`: Clears the display.


       

 - 2: Create an instance of the new class and Add the instance to CLI Widget Generator
   - `CLIWidget cli = CLIWidgetGenerator(CLIManagerBase: instance)`
 - 4: Add the CLIWidget instance to widget tree

 - ### 1 Create a new class that extends the CLIManagerBase
```dart
import 'package:commandline_interface/commandline_interface.dart';
import 'package:flutter/material.dart';

class ExampleManager extends CLIManagerBase {
  ExampleManager();
  
  @override//optional
  inputFieldOnChanged(String s) {
    addWidgetToScreen(Text("text field content changed:"+s));
  }

  @override
  void execute(String command) {
    if(command == 'clear'){
      //clears the screen
      clear();
    } else {

      addWidgetToScreen(
          Text('INPUT: $command', style: TextStyle(color: Colors.greenAccent),)
      );
      addWidgetToScreen(
          Text('OUTPUT: the user has entered "$command"')
      );
      addTextToInputField(
          command.toUpperCase()
      );
    }
  }
}

```
 - ### 2 Use cliWidgetGenerator to set up the manager & get widget 
```dart
final CLIWidget cliWidget = cliWidgetGenerator(ExampleManager());
```
 - ### 3  Add the cliWidget to your widget tree.
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
InputDecoration for the TextField can be set in [config.dart](lib/src/config.dart)
## License
MIT, see LICENSE file for details.

