import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'config.dart';

cliTextFieldBuilder(BehaviorSubject<String> inputStream, BehaviorSubject<String> autoFillStream, BehaviorSubject<String> onChangedStream) {
  //change to take stream, then sink the stream
  //
  TextEditingController controller = TextEditingController();
  //update the stream with the text
  autoFillStream.listen((String s) {
    controller.text = s;
    //move cursor to end
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length)
    );
  });
  FocusNode focusNode = FocusNode();

  return TextField(
    onSubmitted: (String s){
      controller.clear();
      focusNode.requestFocus();//keep focused
      inputStream.add(s);
    },
    onChanged: (String s){
      onChangedStream.add(s);
    },
    focusNode: focusNode,
    autofocus: true,
    controller: controller,
    style: TextStyle(
      color: INPUT_COLOR,
    ),
    decoration: INPUT_DECORATION,
  );
}

