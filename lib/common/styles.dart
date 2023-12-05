import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle title =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle subtitle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  static TextStyle creatorName = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );
  static TextStyle rating = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.orange,
  );
}
