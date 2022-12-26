import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'cli_interpreter.dart';

//USAGE: init,
// init interpreter with get addToDisplayFunc,
// set interpreter

class CLIController {
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content = [];
  late CLIInterpreterMinimal _interpreter;
  //create unImplementedCLIInterpreter in initializer
  CLIController({List<Widget>? content, CLIInterpreterMinimal? init_interpreter})
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
  void clear() {
    _content = [];
    _subject.add(_content);
  }
  set interpreter(CLIInterpreterMinimal interpreter){
    _interpreter = interpreter;
    _interpreter.sink = addToDisplayFunction;
  }

  void dispose() => _subject.close();
  bool get isClosed => _subject.isClosed;
}
