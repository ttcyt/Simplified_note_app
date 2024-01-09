import 'package:flutter/material.dart';
import 'package:simplified_note_app/view/home_page.dart';
import 'package:simplified_note_app/view/new_input_page.dart';

void main() => runApp(SimpleNoteApp());

class SimpleNoteApp extends StatelessWidget {
  const SimpleNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
