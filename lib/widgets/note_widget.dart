import 'package:flutter/material.dart';
import 'package:sampleapp/models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const NoteWidget({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onUpdate),
            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
