import 'package:sampleapp/models/note.dart';

class NoteService {
  // notes state
  final List<Note> _notes = [];

  // getter
  List<Note> getNotes() => _notes;

  // create a new note
  void addNote({required String title, required String description}) {
    Note newNote = Note.create(title: title, description: description);
    _notes.add(newNote);
  }

  // update a existing note
  void updateNote({
    required String id,
    required String title,
    required String description,
  }) {
    final Note noteToUpdate = _notes.firstWhere((note) => note.id == id);
    noteToUpdate.update(title: title, description: description);
  }

  // delete a existing note
  void deleteNote({required String id}) {
    _notes.removeWhere((note) => note.id == id);
  }
}
