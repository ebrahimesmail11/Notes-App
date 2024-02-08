import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_setup_app/constants/const.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/simple_bloc_observer.dart';
import 'package:todo_setup_app/views/ui/notes_views.dart';

void main() async{
  await Hive.initFlutter();
  Bloc.observer=SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp(),);

}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ),
        home: const NotesViews(),
      ),
    );
  }
}

