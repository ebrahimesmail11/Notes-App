import 'package:flutter/material.dart';
import 'package:todo_setup_app/views/shared/add_note_bottom_sheet.dart';
import 'package:todo_setup_app/views/shared/notes_view_body.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
              context: context, builder: (context){
            return const AddNoteBottomSheet();
          });
        },
          child: const  Icon(Icons.add,),
        backgroundColor: Colors.cyan,
      ),
      body: const NotesViewBody(),
    );
  }
}

