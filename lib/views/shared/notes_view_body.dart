import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_setup_app/views/shared/custom_app_bar.dart';
import 'package:todo_setup_app/views/shared/note_item_list.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.060,child:  const CutsomAppBar(text: "Notes",icon: Icon(Icons.search_outlined),),),
            const Expanded(child: NoteItemList()),
          ],
        ),
      ),
    );
  }
}




