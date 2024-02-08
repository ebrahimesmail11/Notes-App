import 'package:flutter/material.dart';
import 'package:todo_setup_app/constants/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText,this.maxLines=1,this.onSaved, this.onChanged});
final String hintText;
final int maxLines;
final void Function(String?)? onSaved;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value){
        if(value?.isEmpty??true){
          return "Failed is empty";
        }else{
          return null;
        }
      },
      onSaved: onSaved,
      cursorColor:kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBroder(),
        enabledBorder: buildBroder(),
        focusedBorder: buildBroder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBroder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color:color??Colors.white),
      );
  }
}
