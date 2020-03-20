import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final text;
  final type;
  final controller;
  BuildTextField(this.text , this.type , this.controller);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color : Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
          focusColor: Colors.grey,
        ),
      ),
    );
  }
}

