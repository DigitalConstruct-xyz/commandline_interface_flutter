import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'cli_manager.dart';

class CLITextFieldController {
  final BehaviorSubject <String> _submitStream;
  final BehaviorSubject <String> _autoFillStream;
  final BehaviorSubject <String> _onChangedStream;
  final BehaviorSubject <TextInputType> _keyboardTypeStream;
  final FocusNode _focusNode;

  List<String> inputHistory = [];
  final CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLITextFieldController({List<String>? content, CLIManagerBase? initManager})
      : _submitStream = BehaviorSubject<String>(),
        _autoFillStream = BehaviorSubject<String>(),
        _onChangedStream = BehaviorSubject<String>()
        , _keyboardTypeStream = BehaviorSubject<TextInputType>.seeded(TextInputType.text)
    ,_manager = initManager ?? UnImplementedCLIManager(),
  _focusNode = FocusNode()
        // _inputHistory = content ?? ([] as List<String>)     // takeInput
  {
    setMangerSubmitStream(_manager);
    setMangerAutoFillStream(_manager);
    setMangerOnChangedStream(_manager);
    setMangerKeyboardTypeStream(_manager);
    _submitStream.listen((String s) {
      inputHistory.add(s);
    });
  }
  BehaviorSubject<String> get submitStream => _submitStream;
  BehaviorSubject<String> get autoFillStream => _autoFillStream;
  BehaviorSubject<String> get onChangedStream => _onChangedStream;
  BehaviorSubject<TextInputType> get keyboardTypeStream => _keyboardTypeStream;
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
  void setMangerKeyboardTypeStream(CLIManagerBase manager){
    manager.setKeyboardType = _keyboardTypeStream.add;
  }



  void dispose() => _submitStream.close();
  bool get isClosed => _submitStream.isClosed;
}



