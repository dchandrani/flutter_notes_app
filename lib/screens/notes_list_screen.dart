import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_note_screen.dart';
import '../providers/note_provider.dart';

class NotesListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notes, _) => ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(
              notes.notes[index].note,
            ),
            subtitle: Text(notes.notes[index].description),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: notes.notes.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNoteScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
