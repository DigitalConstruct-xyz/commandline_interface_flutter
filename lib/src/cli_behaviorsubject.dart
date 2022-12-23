import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_interpreter.dart';

//USAGE: init,
// init interpreter with get addToDisplayFunc,
// set interpreter

class CLIBehaviorSubject {
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content = [];
  late CLIInterpreter _interpreter;
  //create unImplementedCLIInterpreter in initializer
  CLIBehaviorSubject({List<Widget>? content, CLIInterpreter? init_interpreter})
  : _subject = BehaviorSubject<List<Widget>>.seeded(content ?? []),
    _content = content ?? []{
    interpreter = init_interpreter ?? UnImplementedCLIInterpreter();
  }
  Stream<List<Widget>> get stream => _subject.stream;

  void _add(Widget data) {
    _content.add(data);
    _subject.add(_content);
  }//
  Function(Widget) get addToDisplayFunction => _add;

  void input(String s) {
    _interpreter.execute(s);
  }
  set interpreter(CLIInterpreter interpreter){
    _interpreter = interpreter;
    _interpreter.sink = addToDisplayFunction;
  }

  void dispose() => _subject.close();
  bool get isClosed => _subject.isClosed;
}
