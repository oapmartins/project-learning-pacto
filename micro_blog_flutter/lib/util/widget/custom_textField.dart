import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String text) onChanged;
  final String title, value;
  final bool obscureText;

  const CustomTextField({
    Key key,
    this.onChanged,
    this.title,
    this.obscureText = false,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty ?? false,
          child: Text("$title"),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 45,
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            controller: TextEditingController(text: value ?? ''),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
