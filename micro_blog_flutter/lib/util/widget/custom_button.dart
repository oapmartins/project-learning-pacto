import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color background;

  const CustomButton({
    Key key,
    this.title,
    this.onTap,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: RaisedButton(
        color: background,
        child: Text("$title"),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: onTap,
      ),
    );
  }
}
