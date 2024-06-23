import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/database_service.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;
  final int userId;

  AddEditNoteScreen({this.note, required this.userId});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  void _saveNote() async {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String date = DateTime.now().toString();

    if (widget.note == null) {
      final Note newNote = Note(
        title: title,
        content: content,
        date: date,
        userId: widget.userId,
      );
      await _dbService.createNote(newNote);
    } else {
      final Note updatedNote = Note(
        id: widget.note!.id,
        title: title,
        content: content,
        date: date,
        userId: widget.userId,
      );
      await _dbService.updateNote(updatedNote);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 8,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
