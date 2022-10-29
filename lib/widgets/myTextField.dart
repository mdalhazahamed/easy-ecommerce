import 'package:flutter/material.dart';

Widget myTextField(String hintText,keyBoardType,controller){
  return TextFormField(
    validator: (valu) {
                    if (valu!.isEmpty) {
                      return "gender can't be Name";
                    } else {
                      return null;
                    }
                  },
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}