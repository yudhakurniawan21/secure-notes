import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';
import '../models/user.dart';
import '../services/database_service.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _dbService = DatabaseService();
  List<Note> _notes = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchNotes(); // Panggil _fetchNotes setiap kali ada perubahan dependencies
  }

  void _fetchNotes() async {
    final List<Note> notes = await _dbService.getNotesByUserId(widget.user.id!);
    setState(() {
      _notes = notes;
    });
  }

  void _deleteNoteById(int id) async {
    await _dbService.deleteNoteById(id);
    _fetchNotes();
  }

  void _searchNotes(String query) async {
    final List<Note> notes;
    if (query.isEmpty) {
      notes = await _dbService.getNotesByUserId(
          widget.user.id!); // Ambil semua catatan jika query kosong
    } else {
      notes =
          await _dbService.searchNotesByTitleAndUserId(query, widget.user.id!);
    }
    setState(() {
      _notes = notes;
      _searchQuery = query;
    });
  }

  void _navigateToAddEditNoteScreen() async {
    final result = await Navigator.pushNamed(
      context,
      '/add_edit_note',
      arguments: {'userId': widget.user.id},
    );
    if (result == true) {
      _fetchNotes(); // Panggil _fetchNotes setelah kembali dari add/edit screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(16.0),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _searchNotes(query);
              },
            ),
          ),
        ),
      ),
      body: _notes.isEmpty
          ? Center(
              child: Text(
                _searchQuery.isEmpty ? 'No notes available' : 'No notes found',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                final formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(DateTime.parse(note.date));
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(formattedDate),
                    textColor: Colors.brown.shade50,
                    onTap: () {
                      Navigator.pushNamed(context, '/note_detail',
                          arguments: note);
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.amber,
                      onPressed: () {
                        _deleteNoteById(note.id!);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddEditNoteScreen,
        child: Icon(Icons.add),
        foregroundColor: Colors.brown,
        backgroundColor: Colors.brown.shade50,
      ),
    );
  }
}
