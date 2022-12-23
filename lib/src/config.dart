// import 'dart:ui';
//
import 'package:flutter/material.dart';
//
// String INPUT_PREFIX = "  \$ : ";
// String OUTPUT_PREFIX = "  >> ";
// Color ERROR_COLOR = Colors.red;
Color INPUT_COLOR = Colors.green;
// Color OUTPUT_COLOR = Colors.white;
// double INPUT_FONT_SIZE = 20;
// double OUTPUT_FONT_SIZE = 20;
// double TEXT_FIELD_FONT_SIZE = 20;
double TEXT_FIELD_OPAQUE = 0.1;
InputDecoration INPUT_DECORATION = InputDecoration(
  border: const OutlineInputBorder(),
  fillColor : Colors.white.withOpacity(TEXT_FIELD_OPAQUE),
  filled: true,
);
//
// Color getColorOf(String item) {
//   return
//     (item.contains(INPUT_PREFIX, 0)) ?
//       INPUT_COLOR : (item.contains("Error:")) ?
//         ERROR_COLOR : OUTPUT_COLOR;
// }
//
// double getFontSizeOf(String item) {
//   return (item.contains(INPUT_PREFIX, 0)) ?
//   INPUT_FONT_SIZE : OUTPUT_FONT_SIZE;
// }