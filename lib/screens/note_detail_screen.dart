import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:assignment_4/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteDetailScreen extends StatelessWidget {
  final int noteIndex;

  const NoteDetailScreen({super.key, required this.noteIndex});

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
            child: Consumer<NotesProvider>( // Use Consumer to get the latest note
              builder: (context, notesProvider, child) {
                // Get the note using the index to ensure it's the latest version
                final note = notesProvider.notes[noteIndex];
                return Container(
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
                          builder: (context) => EditNoteScreen(
                            notes: note, // Pass the fresh note object
                            noteIndex: noteIndex,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.mode_outlined, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Wrap the body with a Consumer to get the updated note details
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          // Get the note using the index from the provider
          final note = notesProvider.notes[noteIndex];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  note.description,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}