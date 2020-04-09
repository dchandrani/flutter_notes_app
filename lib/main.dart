import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';
import './screens/notes_list_screen.dart';
import './screens/add_note_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: NotesProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        NotesListScreen.routeName: (_) => NotesListScreen(),
        AddNoteScreen.routeName: (_) => AddNoteScreen(),
      },
    );
  }
}
