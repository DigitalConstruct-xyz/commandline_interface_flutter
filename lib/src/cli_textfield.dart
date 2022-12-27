import 'package:flutter/material.dart';
import 'config.dart';

cliTextFieldBuilder(Function(String) sink) {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  return TextField(
    onSubmitted: (String s){
      _controller.clear();
      _focusNode.requestFocus();//keep focused
      sink(s);
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

