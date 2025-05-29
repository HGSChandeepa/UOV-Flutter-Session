import 'package:flutter/material.dart';
import 'package:sampleapp/constants.dart';
import 'package:sampleapp/models/note.dart';
import 'package:sampleapp/services/note_service.dart';
import 'package:sampleapp/widgets/note_widget.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // create a object from the note service class
  final NoteService _noteService = NoteService();
  // text editing controlers for the title and description
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _editingId;

  // cleanup funciton
  void _cleanForm() {
    _titleController.clear();
    _descriptionController.clear();
    _editingId = null;
  }

  //show a dialog
  void _showAddNoteDialog({String? editingId}) {
    print("called");
    // id the editingId is not null it means we are editing a note
    if (editingId != null) {
      final note = _noteService.getNotes().firstWhere(
        (note) => note.id == editingId,
      );

      _titleController.text = note.title;
      _descriptionController.text = note.description;
      _editingId = editingId;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_editingId == null ? 'Add Note' : 'Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final description = _descriptionController.text.trim();

                if (title.isNotEmpty && description.isNotEmpty) {
                  // also here we need to check weather we are editing a note or creating a new one
                  // here if _editingId == null that means we are adding a new note
                  if (_editingId == null) {
                    _noteService.addNote(
                      title: title,
                      description: description,
                    );
                  } else {
                    _noteService.updateNote(
                      id: _editingId!,
                      title: title,
                      description: description,
                    );
                  }
                  // to rebuild the UI
                  setState(() {});
                }
                // clear the form
                _cleanForm();
                //close the dialog box
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // get all the notes using the getter
    List<Note> notes = _noteService.getNotes();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: mainColor,
      ),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet. Tap + to add one.'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final Note note = notes[index];
                return NoteWidget(
                  note: note,
                  onDelete: () {
                    _noteService.deleteNote(id: note.id);
                    setState(() {});
                  },
                  onUpdate: () {
                    // we need to display the dialog to update the note
                    _showAddNoteDialog(editingId: note.id);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNoteDialog();
        },
        backgroundColor: mainColor,
        child: const Icon(Icons.add, color: textColor),
      ),
    );
  }
}
