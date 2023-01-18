
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commandline_interface.dart';

StatelessWidget cliAppGenerator(CLIWidget cliWidget, String title){
  return CLIApp(cliWidget: cliWidget, title: title);
}

class CLIApp extends StatelessWidget {
  var cliWidget;
  var title;

  CLIApp({Key? key, required this.cliWidget, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: CLIPage(cliWidget: cliWidget, title: title),
    );
  }
}

class CLIPage extends StatelessWidget {
  CLIWidget cliWidget;
  String title;
  CLIPage({Key? key, required this.cliWidget, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: cliWidget,
    );
  }
}



