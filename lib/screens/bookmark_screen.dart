import 'package:flutter/material.dart';
import 'package:todaysecho/config/palette.dart';

class BookMarkScreen extends StatefulWidget {
  BookMarkState createState() => BookMarkState();
}

class BookMarkState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SafeArea(
            child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: Center(child: Text("Bookmark", style: headerStyle)),
        ),
      ],
    )));
  }
}
