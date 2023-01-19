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
