import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_manager.dart';

class CLITextFieldController {
  final BehaviorSubject <String> _inputString;
  // List<String> _inputHistory = [];
  CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLITextFieldController({List<String>? content, CLIManagerBase? initManager})
      : _inputString = BehaviorSubject<String>()
  ,_manager = initManager ?? UnImplementedCLIManager()
        // _inputHistory = content ?? ([] as List<String>)     // takeInput
  {
    setMangerInput(_manager);
  }
  BehaviorSubject<String> get stream => _inputString;


  // void sinkTextField(String data) {
  //   _subject.add(data);
  // }//
  //
  CLIManagerBase setMangerInput(CLIManagerBase manager){
    _inputString.listen((String s) {
      _manager.execute(s);
    });
    return _manager;
  }
  set manager(CLIManagerBase interpreter){
    // takeInput: execute by manager

    //  textfieldSink,
    // get lastInputHistoryIF, get ByID
  }

  void dispose() => _inputString.close();
  bool get isClosed => _inputString.isClosed;
}
