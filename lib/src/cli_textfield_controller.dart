import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_manager.dart';

class CLITextFieldController {
  final BehaviorSubject <String> _inputString;
  final BehaviorSubject <String> _outputString;
  List<String> _inputHistory = [];
  CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLITextFieldController({List<String>? content, CLIManagerBase? initManager})
      : _inputString = BehaviorSubject<String>(),
        _outputString = BehaviorSubject<String>()
    ,_manager = initManager ?? UnImplementedCLIManager()
        // _inputHistory = content ?? ([] as List<String>)     // takeInput
  {
    setMangerInputSink(_manager);
    setMangerOutputSink(_manager);
    _inputString.listen((String s) {
      _inputHistory.add(s);
    });
  }
  BehaviorSubject<String> get inputStream => _inputString;
  BehaviorSubject<String> get outputStream => _outputString;
  List<String> get inputHistory => _inputHistory;


  // void sinkTextField(String data) {
  //   _subject.add(data);
  // }//
  //
  void setMangerInputSink(CLIManagerBase manager){
    _inputString.listen((String s) {
      _manager.execute(s);
    });
  }
  void setMangerOutputSink(CLIManagerBase manager){
    manager.textFieldSink = _outputString.add;
  }


  void dispose() => _inputString.close();
  bool get isClosed => _inputString.isClosed;
}
