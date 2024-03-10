import 'package:flutter/material.dart';

Container materialButtonFactory(String text) {
  return Container(
    margin: EdgeInsets.only(left: 12),
    child: MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          Text(text),
          Icon(Icons.arrow_downward_rounded),
        ],
      ),
      color: Color.fromARGB(255, 126, 90, 240),
    ),
  );
}
