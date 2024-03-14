import 'package:flutter/material.dart';

class default_textfield extends StatelessWidget {
  String label;
  IconData icon;
  bool oCultarTexto;
  Function(String text) onChanged;
  String? errorText;

  default_textfield(
      {super.key,
      required this.label,
      required this.icon,
      required this.onChanged,
      this.oCultarTexto = false,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onChanged(text);
      },
      obscureText: oCultarTexto,
      decoration: InputDecoration(
          errorText: errorText,
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      style: TextStyle(color: Colors.white),
    );
  }
}
