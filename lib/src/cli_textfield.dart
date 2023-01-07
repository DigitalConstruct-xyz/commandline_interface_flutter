import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'config.dart';

cliTextFieldBuilder(BehaviorSubject<String> inputStream, BehaviorSubject<String> outputStream) {
  //change to take stream, then sink the stream
  //
  TextEditingController _controller = TextEditingController();
  //update the stream with the text
  outputStream.listen((String s) {
    _controller.text = s;
    //move cursor to end
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length)
    );
  });
  FocusNode _focusNode = FocusNode();

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

