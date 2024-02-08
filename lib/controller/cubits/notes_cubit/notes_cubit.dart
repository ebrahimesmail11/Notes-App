import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_setup_app/constants/const.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_state_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NotesState());
  List<NoteModel>? notes;
  fetchAllNotes()async{
      var notesBox=Hive.box<NoteModel>(kNotesBox);
      notes= notesBox.values.toList();
      emit(NotesSuccess());

  }
}
