import 'package:flutter/material.dart';
import 'package:notes/app/colors.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/widgets/note_card.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      notes: [
        NoteCard(
          title: "Technical Drawing\n Fundamentals",
          subtitle: "Class Notes ",
          backgroundColor: NotesColor.notes,
          imageAsset: 'assets/images/sketch_book.png',
          wordButtonText: '250 words',
          imageButtonText: '2 images',
        ),
      ],
    );
  }
}
