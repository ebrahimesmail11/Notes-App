import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/views/ui/edit_notes.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key, required this.note,
  });
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction){
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      },
      key: Key(note.title),
      direction: DismissDirection.endToStart,
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, builder:(context) {
            return  EditNotes(note: note,);
          }, );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 24,top: 24,bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Color(note.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Text(
                  note.title,
                  style:const  TextStyle(color: Colors.black,fontSize: 24),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      size: 24,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
