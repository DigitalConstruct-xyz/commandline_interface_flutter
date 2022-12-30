import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'config.dart';

cliTextFieldBuilder(BehaviorSubject<String> inputStream) {
  //change to take stream, then sink the stream
  //
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  // stream listen
  return TextField(
    onSubmitted: (String s){
      _controller.clear();
      _focusNode.requestFocus();//keep focused
      inputStream.add(s);
    },
    focusNode: _focusNode,
    autofocus: true,
    controller: _controller,
    style: TextStyle(
      color: INPUT_COLOR,
    ),
    decoration: INPUT_DECORATION,
  );
}

