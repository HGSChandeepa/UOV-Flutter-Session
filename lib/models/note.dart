import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  //create a new note (Here we want to automatically add the created and updated dates) then we can use a factroy constructor

  factory Note.create({required String title, required String description}) {
    DateTime now = DateTime.now();
    return Note(
      id: Uuid().v4(),
      title: title,
      description: description,
      createdAt: now,
      updatedAt: now,
    );
  }

  // methode to update a note (Here we need to automatically set the updated date)
  void update({required String title, required String description}) {
    this.title = title;
    this.description = description;
    updatedAt = DateTime.now();
  }
}
