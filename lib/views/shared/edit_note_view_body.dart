import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/views/shared/custom_app_bar.dart';
import 'package:todo_setup_app/views/shared/custom_text_field.dart';
import 'package:todo_setup_app/views/shared/edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? conntent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .060,
            child:  CutsomAppBar(
              text: "Edit Note",
              onPressed: (){
                widget.note.title=title??widget.note.title;
                widget.note.subTitle=conntent??widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check),
            ),
          ),
          const SizedBox(height: 16,),
           CustomTextField(hintText: widget.note.title,onChanged: (value){
            title=value;
          }),
          const SizedBox(height: 16,),
          CustomTextField(hintText: widget.note.subTitle,maxLines: 5,onChanged: (value){
            conntent=value;
          }
          ),
          const SizedBox(height: 16,),
          EditNoteColorsList(note:  widget.note,),
        ],
      ),
    );
  }
}


