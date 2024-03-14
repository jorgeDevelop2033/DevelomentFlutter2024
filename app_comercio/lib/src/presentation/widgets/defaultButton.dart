import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {
  String text;
  Color color;
  Function() onPressed;

  defaultButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
          child: Text(text, style: TextStyle(color: Colors.black)),
        ));
  }
}
