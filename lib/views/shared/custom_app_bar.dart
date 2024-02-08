import 'package:flutter/material.dart';
import 'package:todo_setup_app/views/shared/custom_search_icon.dart';

class CutsomAppBar extends StatelessWidget {
  const CutsomAppBar({super.key,required this.text, required this.icon, this.onPressed});
final String text;
final Icon icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        CustomSearchIcon(icon: icon,onPressed:onPressed ),
      ],
    );
  }
}
