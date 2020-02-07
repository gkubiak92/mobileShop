import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String size;

  SizeButton(this.size);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(size),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.black),
      ),
      onPressed: () {},
    );
  }
}
