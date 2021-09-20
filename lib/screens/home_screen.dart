import 'package:flutter/material.dart';
import 'package:todaysecho/config/data_config.dart';
import 'package:todaysecho/config/palette.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> sections = [
    "All",
    "Policies",
    "Sports",
    "Technology",
    "LifeStyle",
    "Photography"
        "Entertainment"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("News", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        height: screenSizeHeight(context),
        width: screenSizeWidth(context),
        child: Column(
          children: [
            Container(
              width: screenSizeWidth(context),
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      sections[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: screenSizeWidth(context),
              height: 200,
              child: PageView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
