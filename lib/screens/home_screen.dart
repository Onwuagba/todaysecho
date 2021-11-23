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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/todays_echo.png"),
                  height: 50,
                ),
              ),
              Navigation(sections: sections),
              FutureBuilder<List<ContentData>>(
                  future: getNewsContent(),
                  builder: (ontext, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return Content(
                        contentData: snapshot.data,
                      );
                    } else {
                      return Expanded(child: Text("Encountered an error"));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
    required this.sections,
  }) : super(key: key);

  final List<String> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(sections[index]),
            ));
          },
        ));
  }
}

class Content extends StatelessWidget {
  final List<ContentData>? contentData;
  const Content({Key? key, required this.contentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showNewsInfo(ContentData _data) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsView(
                    data: _data,
                  )));
    }

    return Expanded(
      child: ListView(
        children: contentData!
            .map((e) => GestureDetector(
                  onTap: () {
                    _showNewsInfo(e);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment(-1, 1),
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(e.urlImage))),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Color(0x00000000),
                                Color(0x80000000),
                              ])),
                          child: Text(
                            e.title ?? "",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: null, icon: Icon(Icons.favorite)),
                            IconButton(
                                onPressed: null, icon: Icon(Icons.bookmark))
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
