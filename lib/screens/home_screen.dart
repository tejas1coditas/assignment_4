import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:assignment_4/screens/add_note_screen.dart';

import 'package:assignment_4/screens/note_detail_screen.dart';
import 'package:assignment_4/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 43,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.search, color: whiteColor),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.info, color: whiteColor),
          ),
          SizedBox(width: 10),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesProvider>(
        builder: (context, noteprovider, child) {
          return GestureDetector(
            onTap: () => noteprovider.clearDeletionSelection(),
            child: noteprovider.notes.isEmpty
                ? Column(
                    children: [
                      Image.asset(homeScreenImage),
                      Text(
                        'Create your first note!!',
                        style: TextStyle(color: whiteColor),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 40.0, 25, 20),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final note = noteprovider.getNotes()[index];
                        final isSelectedForDeletion =
                            noteprovider.noteSelectedForDeletion == note;

                        return ListTile(
                          onTap: () {
                            if (isSelectedForDeletion) {
                              noteprovider.clearDeletionSelection();
                            } else if (noteprovider.noteSelectedForDeletion !=
                                null) {
                              noteprovider.clearDeletionSelection();
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NoteDetailScreen(note: note),
                                ),
                              );
                            }
                          },
                          onLongPress: () {
                            noteprovider.selectNoteForDeletion(note);
                          },
                          title: isSelectedForDeletion
                              ? Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: whiteColor,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      noteprovider.deleteNote(note);
                                    },
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                  ),
                                  child: Text(
                                    note.title,
                                    style: TextStyle(
                                      color: backgroundColor,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),

                          tileColor: isSelectedForDeletion
                              ? Colors.red
                              : noteprovider.getColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      },
                      separatorBuilder: (context, child) =>
                          SizedBox(height: 20),
                      itemCount: noteprovider.getLength(),
                    ),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        backgroundColor: containerColor,

        shape: CircleBorder(),
        child: Icon(Icons.add_outlined, color: whiteColor, size: 30),
      ),
    );
  }
}
