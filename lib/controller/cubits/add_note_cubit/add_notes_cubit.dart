
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_setup_app/constants/const.dart';
import 'package:todo_setup_app/controller/cubits/add_note_cubit/add_notes_state_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit():super(AddNotesInitial());
  Color color=const Color(0xffDDD1C7);
  addNote(NoteModel note)async{
    note.color=color.value;
    emit(AddNotesLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      // var notesBox=Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());

    }catch(e){
      emit(AddNotesFailure(e.toString()),);
    }


  }
}
