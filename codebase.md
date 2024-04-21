Files and Content:
./project_plan.md
./LICENSE
./CHANGELOG.md
./.metadata
./README.md
./pubspec.yaml
./lib/commandline_interface.dart
./lib/src/cli_manager.dart
./lib/src/cli_widget.dart
./lib/src/cli_textfield_controller.dart
./lib/src/generator/cli_app_generator.dart
./lib/src/generator/cli_widget_generator.dart
./lib/src/config.dart
./lib/src/cli_display.dart
./lib/src/super_textfield.dart
./lib/src/cli_display_controller.dart
Content for ./project_plan.md:
```md
#

### Input History
In ManagerBase
- Add input to _inputHistory
- Record input
- instance methods: _inputHistory, _recordInput

```dart
String getInputHistoryByID(int id){
  return "input history of id";
}
int getLastInputHistoryID(){
  return 0;//return^
}
```


[//]: # (```)

### Text Field Sink

```dart
void sinkTextFieldCompletion(String tex) {
  //sink text to text field
}
```

- refactor sinkTextField to addToTextField

manager&display controller
functions get&set content
manager 
new functions: 
    onChanged,
    set content, get content,
refactor:
    add to screen, add to text field

onchange stream


# new input text field
- gray trailing sugestions
- generator 3 streams
  - 1. text field content
  1. onchanged
  2. submit
  --
  3. autofill <- inward, create, listen, pass to external to get
     add to the last part of text with gray color
    prevent cursor misplacement


### keyboard type: text input type stream

### suggester textfield
### suggestion stream

roll back changes to text field

input text field stream keyboard type - test
focusnode
set scroll position stream: scrollPositionedController
gesture detector stream
```

Content for ./LICENSE:
```/LICENSE
Copyright (c) [2022] [YUXUAN LIU]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

Content for ./CHANGELOG.md:
```md
## 0.0.1
## 0.0.2 
## 0.0.5
## 0.0.7 new features: add text to TextField, get inputHistory```

Content for ./.metadata:
```metadata
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: b8f7f1f9869bb2d116aa6a70dbeac61000b52849
  channel: stable

project_type: package
```

Content for ./README.md:
```md

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
     - this is where you will implement the logic of your CLI
       - use `addWidgetToScreen(Widget)` to add widget to the CLI
       - `setWidgetsOnScreen(List<Widget>)` to set the widgets on the CLI
       - `inputFieldOnChanged(String)` to process changes in the input text field`
       - use `clear()` to clear the CLI
       - use `addTextToInputField(String text)` to add text to the input text field
       - use `setKeyboaryType(TextInputType)`
       - 

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
  
  @override//optional
  inputFieldOnChanged(String s) {
    addWidgetToScreen(Text("text field content changed:"+s));
  }

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
      addWidgetToScreen(
          Text('INPUT: $command', style: TextStyle(color: Colors.greenAccent),)
      );
      addWidgetToScreen(
          Text('OUTPUT: the user has entered "$command"')
      );
      //ADD TEXT TO TEXT FIELD
      addTextToInputField(
          command.toUpperCase()
      );
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
```

Content for ./pubspec.yaml:
```yaml
name: commandline_interface
description: CLI. Minimalist.
repository: https://github.com/monki1/commandline_interface_flutter.git
version: 0.0.7

environment:
  sdk: '>=2.18.5 <3.0.0'
  flutter: ">=1.17.0"

dependencies:
  flutter:
    sdk: flutter

  rxdart: ^0.27.7


dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.1


flutter:
```

Content for ./lib/commandline_interface.dart:
```dart

export 'src/cli_widget.dart';
export 'src/cli_display_controller.dart';
export 'src/cli_manager.dart';
export 'src/generator/cli_widget_generator.dart';
export 'src/generator/cli_app_generator.dart';



```

Content for ./lib/src/cli_manager.dart:
```dart
import 'package:flutter/cupertino.dart';

abstract class CLIManagerBase {
  Function(Widget) addWidgetToScreen= cliDefault_add_to_screen;
  Function(Widget) removeWidgetFromScreen = cliDefault_remove_from_screen;
  //get widgets on screen
  List<Widget> Function() getWidgetsOnScreen = ()=>[];
  Function(List<Widget> widgets) setWidgetsOnScreen = cliDefaultSetWidgetsOnScreen;
  //set widgets on screen
  Function(String) addTextToInputField = cliDefaultTextFieldSink;
  Function(TextInputType) setKeyboardType = (TextInputType tit){};
  //onChanged 
  void inputFieldOnChanged(String s){}
  void Function() clear = cliDefaultClear;
  void execute(String command);
}
cliDefault_add_to_screen(Widget widget) => debugPrint('Unimplemented: $widget');
cliDefaultClear() => debugPrint('Unimplemented: clear');
cliDefaultTextFieldSink(String s) => debugPrint('Unimplemented: $s');
cliDefaultInputFieldOnChanged(String s) => debugPrint('Unimplemented: $s');
cliDefaultGetWidgetsOnScreen() => debugPrint('Unimplemented: getWidgetsOnScreen');
cliDefaultSetWidgetsOnScreen(List<Widget> widgets) => debugPrint('Unimplemented: setWidgetsOnScreen');
cliDefault_remove_from_screen(Widget widget) => debugPrint('Unimplemented: $widget');
class UnImplementedCLIManager extends CLIManagerBase {
  UnImplementedCLIManager();
  @override
  void execute(String command) {
    addWidgetToScreen(
       Container(child: Text('Unimplemented CLIInterpreter'))
    );
  }
}


```

Content for ./lib/src/cli_widget.dart:
```dart
import 'package:flutter/material.dart';
import 'cli_display_controller.dart';
import 'cli_display.dart';
import 'super_textfield.dart';
import 'cli_textfield_controller.dart';

class CLIWidget extends StatelessWidget{
  // final CLIInterpreter _interpreter;
  final CLIDisplayController _displayController;
  final CLITextFieldController _textFieldController;
   CLIWidget(this._displayController, this._textFieldController);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: cliDisplayBuilder(_displayController.stream)),
        // Expanded(child:
        superTextFieldFactory(_textFieldController.submitStream, _textFieldController.autoFillStream,
            _textFieldController.onChangedStream, _textFieldController.focusNode),
        // ),
        ]
    );
  }
}```

Content for ./lib/src/cli_textfield_controller.dart:
```dart
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'cli_manager.dart';

class CLITextFieldController {
  final BehaviorSubject <String> _submitStream;
  final BehaviorSubject <String> _autoFillStream;
  final BehaviorSubject <String> _onChangedStream;
  // final BehaviorSubject <TextInputType> _keyboardTypeStream;
  final FocusNode _focusNode;

  List<String> inputHistory = [];
  final CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLITextFieldController({List<String>? content, CLIManagerBase? initManager})
      : _submitStream = BehaviorSubject<String>(),
        _autoFillStream = BehaviorSubject<String>(),
        _onChangedStream = BehaviorSubject<String>()
        // , _keyboardTypeStream = BehaviorSubject<TextInputType>.seeded(TextInputType.text)
    ,_manager = initManager ?? UnImplementedCLIManager(),
  _focusNode = FocusNode()
        // _inputHistory = content ?? ([] as List<String>)     // takeInput
  {
    setMangerSubmitStream(_manager);
    setMangerAutoFillStream(_manager);
    setMangerOnChangedStream(_manager);
    // setMangerKeyboardTypeStream(_manager);
    _submitStream.listen((String s) {
      inputHistory.add(s);
    });
  }
  BehaviorSubject<String> get submitStream => _submitStream;
  BehaviorSubject<String> get autoFillStream => _autoFillStream;
  BehaviorSubject<String> get onChangedStream => _onChangedStream;
  // BehaviorSubject<TextInputType> get keyboardTypeStream => _keyboardTypeStream;
  FocusNode get focusNode => _focusNode;

  void setMangerSubmitStream(CLIManagerBase manager){
    _submitStream.listen((String s) {
      _manager.execute(s);
    });
  }
  void setMangerOnChangedStream(CLIManagerBase manager){
    _onChangedStream.listen((String s) {
      _manager.inputFieldOnChanged(s);
    });
  }

  void setMangerAutoFillStream(CLIManagerBase manager){
    manager.addTextToInputField = _autoFillStream.add;
  }
  //set manager setKeyboardType
  // void setMangerKeyboardTypeStream(CLIManagerBase manager){
  //   manager.setKeyboardType = _keyboardTypeStream.add;
  // }



  void dispose() => _submitStream.close();
  bool get isClosed => _submitStream.isClosed;
}



```

Content for ./lib/src/generator/cli_app_generator.dart:
```dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commandline_interface.dart';

ThemeData defaultTheme = ThemeData.dark();

StatelessWidget cliAppGenerator(CLIWidget cliWidget, String title, ThemeData theme) {
  return CLIApp(cliWidget: cliWidget, title: title, theme: theme);
}

class CLIApp extends StatelessWidget {
  var cliWidget;
  var title;
  ThemeData theme;

  CLIApp({Key? key, required this.cliWidget, required this.title, required this.theme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme,
      home: CLIPage(cliWidget: cliWidget
          // , title: title
      ),
    );
  }
}

class CLIPage extends StatelessWidget {
  CLIWidget cliWidget;
  // String title;
  CLIPage({Key? key, required this.cliWidget
    // , required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: SafeArea(child: cliWidget),
    );
  }
}



```

Content for ./lib/src/generator/cli_widget_generator.dart:
```dart

import '../../commandline_interface.dart';
import '../cli_textfield_controller.dart';


CLIWidget cliWidgetGenerator(CLIManagerBase manager){
  CLIDisplayController cliDisplayController = CLIDisplayController(initManager: manager);
  CLITextFieldController cliTextFieldController = CLITextFieldController(initManager: manager);
  CLIWidget cliWidget = CLIWidget(cliDisplayController, cliTextFieldController);
  //set manager of textfield controller
  return cliWidget;
}```

Content for ./lib/src/config.dart:
```dart
import 'package:flutter/material.dart';

const Color INPUT_COLOR = Colors.green;
const double TEXT_FIELD_OPAQUE = 0.1;
InputDecoration INPUT_DECORATION = InputDecoration(
  border: const OutlineInputBorder(),
  fillColor : Colors.white.withOpacity(TEXT_FIELD_OPAQUE),
  filled: true,
);
```

Content for ./lib/src/cli_display.dart:
```dart
import 'package:flutter/material.dart';

cliDisplayBuilder(Stream<List<Widget>> stream){
   //display in a scrollable list
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Widget item = snapshot.data![index];
              return Container(child: item);
            },
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );


}```

Content for ./lib/src/super_textfield.dart:
```dart
import 'package:commandline_interface/src/config.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

TextField superTextFieldFactory(BehaviorSubject<String> inputStream, BehaviorSubject<String> autoFillStream, BehaviorSubject<String> onChangedStream, FocusNode focusNode,
    {TextInputType keyboardType = TextInputType.text}) {
  //change to take stream, then sink the stream
  //
  TextEditingController controller = TextEditingController(); //update the stream with the text
  autoFillStream.listen((String s) {
    controller.text = s;
    //move cursor to end
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length)
    );
  });

  TextField t =  TextField(
    onSubmitted: (String s){
      controller.clear();
      focusNode.requestFocus();//keep focused
      inputStream.add(s);
    },
    onChanged: (String s){
      onChangedStream.add(s);
    },
    focusNode: focusNode,
    autofocus: true,
    controller: controller,
    decoration: INPUT_DECORATION,
  );

  return t;
}
// superTextFieldStreamBuilder(BehaviorSubject<String> autofill, BehaviorSubject<String> submit, BehaviorSubject<String> onChanged, BehaviorSubject<TextInputType> keyboardType,   FocusNode focusNode
// ){
//
//   return
//     StreamBuilder(
//         stream: keyboardType.stream,
//         builder: (BuildContext context, AsyncSnapshot<TextInputType> snapshot){
//           return superTextFieldFactory(autofill, submit, onChanged, focusNode, keyboardType: snapshot.data ?? TextInputType.text);
//         }
//     );
// }
```

Content for ./lib/src/cli_display_controller.dart:
```dart
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_manager.dart';

class CLIDisplayController {
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content = [];
  late CLIManagerBase _manager;
  CLIDisplayController({List<Widget>? content, CLIManagerBase? initManager})
  : _subject = BehaviorSubject<List<Widget>>.seeded(content ?? []),
    _content = content ?? []{
    manager = initManager ?? UnImplementedCLIManager();
  }
  Stream<List<Widget>> get stream => _subject.stream;

  void add(Widget data) {
    _content.add(data);
    _subject.add(_content);
  }//
  // Function(Widget) get add => _add;

  void remove(Widget data) {
    _content.remove(data);
    _subject.add(_content);
  }

  void clear() {
    _content = [];
    _subject.add(_content);
  }
  set manager(CLIManagerBase interpreter){
    _manager = interpreter;
    _manager.addWidgetToScreen = add;
    _manager.getWidgetsOnScreen = () => _content;
    _manager.setWidgetsOnScreen = (List<Widget> widgets){_content = widgets; _subject.add(_content);};
    _manager.clear = clear;
    _manager.removeWidgetFromScreen = remove;
  }

  void dispose() => _subject.close();
  bool get isClosed => _subject.isClosed;
}
```

