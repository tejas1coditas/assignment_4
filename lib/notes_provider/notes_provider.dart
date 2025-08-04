import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class NotesProvider extends ChangeNotifier {
  List<NotesModel> notes = [];
  Random random = Random();
  NotesModel? noteSelectedForDeletion;

  List<Color> colorList = [
    tileColor1,
    tileColor2,
    tileColor3,
    tileColor4,
    tileColor5,
  ];

  List<NotesModel> getNotes() {
    return notes;
  }

  void addNotes(NotesModel note) {
    notes.add(note);
    notifyListeners();
  }

  int getLength() {
    return notes.length;
  }

  void updateTask(NotesModel oldNotes, NotesModel newNotes) {
    final index = notes.indexOf(oldNotes);
    notes[index] = newNotes;
    notifyListeners();
  }

  Color getColor() {
    return colorList[Random().nextInt(colorList.length)];
  }

  void deleteNote(NotesModel note) {
    notes.remove(note);
    noteSelectedForDeletion = null;
    notifyListeners();
  }

    void selectNoteForDeletion(NotesModel note) {
    noteSelectedForDeletion = note;
    notifyListeners();
  }
  void clearDeletionSelection() {
    noteSelectedForDeletion = null;
    notifyListeners();
  }
}
