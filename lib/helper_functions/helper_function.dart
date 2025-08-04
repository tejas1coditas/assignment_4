import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void saveNote({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required int noteIndex,
}) {
  final title = titleController.text;
  final description = descriptionController.text;

  if (title.isNotEmpty) {
    final updatedNote = NotesModel(title: title, description: description);

    Provider.of<NotesProvider>(
      context,
      listen: false,
    ).updateTask(noteIndex, updatedNote);

    Navigator.pop(context);
  }
}

void showSaveConfirmationDialog({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required int noteIndex,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: const Icon(Icons.info, color: Color(0XFF606060)),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: const Text(
            'Are you sure you want to discrad your changes?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 8),
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();

                      saveNote(
                        context: context,
                        titleController: titleController,
                        descriptionController: descriptionController,
                        noteIndex: noteIndex,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void addNewNote({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
}) {
  final title = titleController.text;
  final description = descriptionController.text;

  final newNote = NotesModel(title: title, description: description);
  Provider.of<NotesProvider>(context, listen: false).addNotes(newNote);
  Navigator.pop(context);
}

void showAddNoteConfirmationDialog({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: const Icon(Icons.info, color: Color(0XFF606060)),
        content: const Padding(
          padding: EdgeInsets.fromLTRB(38, 0, 0, 0),
          child: Text(
            'Save changes ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 8),
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 8),
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      addNewNote(
                        context: context,
                        titleController: titleController,
                        descriptionController: descriptionController,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
