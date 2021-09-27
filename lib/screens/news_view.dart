import 'dart:ui';

import "package:flutter/material.dart";
import 'package:todaysecho/config/data_config.dart';

class NewsView extends StatelessWidget {
  final Data? data;
  NewsView({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _category(),
                _header(),
                _newsImage(),
                _bookmarkAndAuthor(),
                _information(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _category() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(data?.category ?? "No category"),
      );

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        data?.title ?? "No Header Info",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
      ),
    );
  }

  Hero _newsImage() {
    return Hero(
      tag: data?.image ?? "No tag",
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/${data?.image}"),
        width: double.infinity,
        height: 200,
      ),
    );
  }

  Container _bookmarkAndAuthor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Author"),
          Icon(Icons.bookmark_outline),
        ],
      ),
    );
  }

  Container _information() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        data?.content ?? "No Information",
        softWrap: true,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
