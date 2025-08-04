import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:assignment_4/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _searchController,
      builder: (context, _, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: whiteColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: TextField(
              controller: _searchController,
              autofocus: true,
              style: TextStyle(color: whiteColor, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Search by the keyword...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,

                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: whiteColor),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
              ),
            ),
          ),

          body: Consumer<NotesProvider>(
            builder: (context, notesProvider, child) {
              final query = _searchController.text.toLowerCase();

              if (query.isEmpty) {
                return const Center(
                  child: Text(
                    'Search for notes by title.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              final allNotes = notesProvider.getNotes();
              final filteredNotes = allNotes
                  .where((note) => note.title.toLowerCase().contains(query))
                  .toList();

              if (filteredNotes.isEmpty) {
                return Column(
                  children: [
                    Image.asset(searchScreenImage),
                    Text(
                      'File not found. Try searching again.',
                      style: TextStyle(color: whiteColor, fontSize: 20),
                    ),
                  ],
                );
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: filteredNotes.length,
                  separatorBuilder: (context, child) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final note = filteredNotes[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(notes: note),
                          ),
                        );
                      },
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          note.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      tileColor: notesProvider.getColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
