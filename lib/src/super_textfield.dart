import 'package:commandline_interface/src/config.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

TextField superTextFieldFactory(BehaviorSubject<String> inputStream, BehaviorSubject<String> autoFillStream, BehaviorSubject<String> onChangedStream, FocusNode focusNode,
    {TextInputType keyboardType = TextInputType.text}) {
  //change to take stream, then sink the stream
  //
  TextEditingController controller = TextEditingController(); //update the stream with the text
  autoFillStream.listen((String s) {
    controller.text = s;
    //move cursor to end
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length)
    );
  });

  TextField t =  TextField(
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
    decoration: INPUT_DECORATION,
  );

  return t;
}
superTextFieldStreamBuilder(BehaviorSubject<String> autofill, BehaviorSubject<String> submit, BehaviorSubject<String> onChanged, BehaviorSubject<TextInputType> keyboardType,   FocusNode focusNode
){

  return
    StreamBuilder(
        stream: keyboardType.stream,
        builder: (BuildContext context, AsyncSnapshot<TextInputType> snapshot){
          return superTextFieldFactory(autofill, submit, onChanged, focusNode, keyboardType: snapshot.data ?? TextInputType.text);
        }
    );
}
