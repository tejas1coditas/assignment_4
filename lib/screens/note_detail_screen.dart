import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  final NotesModel note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNoteScreen(notes: note),
                    ),
                  );
                },
                child:  Icon(Icons.mode_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              note.description,
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
