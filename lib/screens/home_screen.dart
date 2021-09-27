import 'package:flutter/material.dart';
import 'package:todaysecho/config/data_config.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/screens/news_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(viewportFraction: 0.9);
  List<String> sections = [
    "All",
    "Business",
    "Policies",
    "Sports",
    "Entertainment",
    "LifeStyle",
    "Technology",
    "Photography",
  ];

  _showNewsInfo(Data _data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsView(
                  data: _data,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _header(),
          _newsSections(context),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  _newsViewFeed(context),
                  _latestNewsHeader(),
                  _latestNews()
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 10),
      child: Image(
        image: AssetImage("assets/images/todays_echo.png"),
        height: 50,
      ),
    );
  }

  Container _newsSections(BuildContext context) {
    return Container(
      width: screenSizeWidth(context),
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              sections[index],
              style: TextStyle(fontSize: 17),
            ),
          );
        },
      ),
    );
  }

  Container _newsViewFeed(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: 260,
        child: PageView.builder(
          controller: pageController,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                ),
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Hero(
                        tag: data[index].image ?? "No name",
                        child: GestureDetector(
                          onTap: () {
                            _showNewsInfo(data[index]);
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/${data[index].image}'),
                            height: 160,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        data[index].title ?? "No Title",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "April 16, 2020",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Icon(Icons.bookmark_outline)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Padding _latestNewsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest News",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          TextButton(onPressed: () {}, child: Text("See More"))
        ],
      ),
    );
  }

  Container _latestNews() {
    return Container(
        child: Column(
      children: data.map((e) {
        return Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/${e.image}'))),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  height: 95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title ?? "No Info",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "BY JOHN F. HADDS | 3 min ago",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    ));
  }
}
