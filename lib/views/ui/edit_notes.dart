import 'package:flutter/material.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/views/shared/edit_note_view_body.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note,),
    );
  }
}

