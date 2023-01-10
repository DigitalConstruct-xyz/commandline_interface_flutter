import 'package:rxdart/rxdart.dart';

import 'cli_manager.dart';

class CLITextFieldController {
  final BehaviorSubject <String> _submitStream;
  final BehaviorSubject <String> _autoFillStream;
  final BehaviorSubject <String> _onChangedStream;
  List<String> inputHistory = [];
  final CLIManagerBase _manager;
  //create unImplementedCLIInterpreter in initializer
  CLITextFieldController({List<String>? content, CLIManagerBase? initManager})
      : _submitStream = BehaviorSubject<String>(),
        _autoFillStream = BehaviorSubject<String>(),
        _onChangedStream = BehaviorSubject<String>()
    ,_manager = initManager ?? UnImplementedCLIManager()
        // _inputHistory = content ?? ([] as List<String>)     // takeInput
  {
    setMangerSubmitStream(_manager);
    setMangerAutoFillStream(_manager);
    setMangerOnChangedStream(_manager);
    _submitStream.listen((String s) {
      inputHistory.add(s);
    });
  }
  BehaviorSubject<String> get submitStream => _submitStream;
  BehaviorSubject<String> get autoFillStream => _autoFillStream;
  BehaviorSubject<String> get onChangedStream => _onChangedStream;


  // void sinkTextField(String data) {
  //   _subject.add(data);
  // }//
  //


  void setMangerSubmitStream(CLIManagerBase manager){
    _submitStream.listen((String s) {
      _manager.execute(s);
    });
  }
  void setMangerOnChangedStream(CLIManagerBase manager){
    _onChangedStream.listen((String s) {
      _manager.inputFieldOnChanged(s);
    });
  }

  void setMangerAutoFillStream(CLIManagerBase manager){
    manager.addTextToInputField = _autoFillStream.add;
  }
  //set manager onChangedstream



  void dispose() => _submitStream.close();
  bool get isClosed => _submitStream.isClosed;
}
