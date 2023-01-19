
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commandline_interface.dart';

ThemeData defaultTheme = ThemeData.dark();

StatelessWidget cliAppGenerator(CLIWidget cliWidget, String title, ThemeData theme) {
  return CLIApp(cliWidget: cliWidget, title: title, theme: theme);
}

class CLIApp extends StatelessWidget {
  var cliWidget;
  var title;
  ThemeData theme;

  CLIApp({Key? key, required this.cliWidget, required this.title, required this.theme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme,
      home: CLIPage(cliWidget: cliWidget
          // , title: title
      ),
    );
  }
}

class CLIPage extends StatelessWidget {
  CLIWidget cliWidget;
  // String title;
  CLIPage({Key? key, required this.cliWidget
    // , required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: SafeArea(child: cliWidget),
    );
  }
}



