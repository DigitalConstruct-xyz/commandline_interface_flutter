import 'package:flutter/material.dart';

const Color INPUT_COLOR = Colors.green;
const double TEXT_FIELD_OPAQUE = 0.1;
InputDecoration INPUT_DECORATION = InputDecoration(
  border: const OutlineInputBorder(),
  fillColor : Colors.white.withOpacity(TEXT_FIELD_OPAQUE),
  filled: true,
);
