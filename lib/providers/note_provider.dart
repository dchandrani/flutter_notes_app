import 'package:flutter/foundation.dart';

class Note {
  final String id;
  final String note;
  final String description;
  final bool isCompleted;

  const Note({
    this.id,
    this.note,
    this.description,
    this.isCompleted = false,
  });
}

class NotesProvider with ChangeNotifier {
  final List<Note> _notes = [
    Note(id: '1', note: 'First note', description: 'This is the first note description.'),
    Note(id: '2', note: 'Second note', description: 'This is the second note description.'),
  ];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }
}