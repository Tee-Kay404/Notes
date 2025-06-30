import 'package:flutter/material.dart';
import 'package:notes/app/colors.dart';

class NoteData {
  static List<Map<String, dynamic>> notes = [
    {
      "title": "Technical Drawing\nFundamentals",
      "subtitle": "Class Notes",
      "backgroundColor": NotesColor.notes,
      "imageAsset": 'assets/images/sketch_book.png',
      "wordButtonText": '250 words',
      "imageButtonText": '2 images',
    },
    {
      "title": "Steel & Brass\nTensile Test",
      "subtitle": "Lab Report",
      "backgroundColor": Colors.white,
      "imageAsset": 'assets/images/steel.png',
      "wordButtonText": '350 words',
      "imageButtonText": '3 images',
    },
    {
      "title": "Programming in\nFlutter & Dart",
      "subtitle": "Code Samples",
      "backgroundColor": Colors.blue.shade100,
      "imageAsset": 'assets/images/web.PNG',
      "wordButtonText": '500 words',
      "imageButtonText": '5 images',
    },
    {
      "title": "Surveying &\nLevelling",
      "subtitle": "Lecture Notes",
      "backgroundColor": Color(0xFFE0F2F1),
      "imageAsset": 'assets/images/airplane.png',
      "wordButtonText": '150 words',
      "imageButtonText": '1 image',
    },
    {
      "title": "Concrete Mix\nDesign",
      "subtitle": "Site Work",
      "backgroundColor": Color(0xFFFFE0B2),
      "imageAsset": 'assets/images/concrete.png',
      "wordButtonText": '200 words',
      "imageButtonText": '2 images',
    },
  ];
}
