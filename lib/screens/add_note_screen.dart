import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  static const routeName = '/add-note';
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: noteController,
              decoration: InputDecoration(hintText: 'Enter note'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Enter description'),
              maxLines: 3,
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {
                  print(noteController.text);
                  print(descriptionController.text);

                  final note = noteController.text;
                  final description = descriptionController.text;

                  if(note.isNotEmpty) {
                    final Note noteObj = Note(id: DateTime.now().millisecondsSinceEpoch.toString(), note: note);
                    Provider.of<NotesProvider>(context, listen: false).addNote(noteObj);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add note',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
