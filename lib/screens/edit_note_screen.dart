
import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/helper_functions/helper_function.dart';
import 'package:assignment_4/models/notes_model.dart';

import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.notes});
  final NotesModel notes;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.notes.title.trim());
    descriptionController = TextEditingController(
      text: widget.notes.description.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: GestureDetector(
                onTap: () {
                  showSaveConfirmationDialog(
                    context: context,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    originalNote: widget.notes,
                  );
                },
                child: Icon(Icons.save, color: whiteColor),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style:  TextStyle(color: whiteColor, fontSize: 46),
                    controller: titleController,
                    cursorHeight: 38,
                    cursorColor: whiteColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style:  TextStyle(color: whiteColor, fontSize: 16),
                    controller: descriptionController,
                    cursorColor: whiteColor,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something....',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
