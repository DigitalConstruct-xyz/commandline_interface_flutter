import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_manager.dart';

class CLIController {
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content = [];
  late CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLIController({List<Widget>? content, CLIManagerBase? initManager})
  : _subject = BehaviorSubject<List<Widget>>.seeded(content ?? []),
    _content = content ?? []{
    manager = initManager ?? UnImplementedCLIManager();
  }
  Stream<List<Widget>> get stream => _subject.stream;

  void _add(Widget data) {
    _content.add(data);
    _subject.add(_content);
  }//
  Function(Widget) get addToDisplayFunction => _add;

  void input(String s) {
    _manager.execute(s);
  }
  void clear() {
    _content = [];
    _subject.add(_content);
  }
  set manager(CLIManagerBase interpreter){
    _manager = interpreter;
    _manager.sink = addToDisplayFunction;
    _manager.clear = clear;
  }

  void dispose() => _subject.close();
  bool get isClosed => _subject.isClosed;
}
