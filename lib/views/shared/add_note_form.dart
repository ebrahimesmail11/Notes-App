import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_setup_app/controller/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:todo_setup_app/controller/cubits/add_note_cubit/add_notes_state_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/views/shared/color_list_view.dart';
import 'package:todo_setup_app/views/shared/custom_buttom.dart';
import 'package:todo_setup_app/views/shared/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: "title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: "conttent",
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (BuildContext context, AddNotesState state) {
              return CustomButtom(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  checkSaveData(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void checkSaveData(BuildContext context) {
     if (fromKey.currentState!.validate()) {
      fromKey.currentState!.save();
      var currentData=DateTime.now();
      var formattedCurrentData=DateFormat.yMd().format(currentData);
      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: formattedCurrentData,
          color: Colors.indigoAccent.value,
      );
      BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

