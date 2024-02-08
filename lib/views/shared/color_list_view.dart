import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_setup_app/constants/const.dart';
import 'package:todo_setup_app/controller/cubits/add_note_cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key,required this.isActive, required this.color});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive? CircleAvatar(
      radius: 38,
      backgroundColor:Colors.white,
      child: CircleAvatar(
        radius: 36,
        backgroundColor:color,
      ),
    ):  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}
class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                currentIndex=index;
                BlocProvider.of<AddNotesCubit>(context).color=kColors[index];
                setState(() {

                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6,),
                child:  ColorItem(isActive: currentIndex==index, color: kColors[index],),
              ),
            );
          }
      ),
    );
  }
}