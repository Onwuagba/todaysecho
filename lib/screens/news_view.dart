import 'dart:ui';

import "package:flutter/material.dart";
import 'package:todaysecho/config/data_config.dart';

class NewsView extends StatelessWidget {
  final ContentData? data;
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
                _newsImage(),
                _header(),
                _bookmarkAndAuthor(),
                _information(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      tag: data?.urlImage ?? "No tag",
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(data?.urlImage),
        width: double.infinity,
        height: 250,
      ),
    );
  }

  Container _bookmarkAndAuthor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("by ${data?.author}"),
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
