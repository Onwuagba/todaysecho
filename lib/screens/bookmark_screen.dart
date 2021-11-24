import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaysecho/config/data_config.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/config/state_management.dart';
import 'package:todaysecho/screens/news_view.dart';

class BookMarkScreen extends StatefulWidget {
  BookMarkState createState() => BookMarkState();
}

class BookMarkState extends State<BookMarkScreen> {
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

    AppProvider _appProvider = Provider.of<AppProvider>(context, listen: false);

    return Expanded(
        child: SafeArea(
            child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: Center(child: Text("Bookmark", style: headerStyle)),
        ),
        Expanded(
          child: ListView(
            children: _appProvider.data
                .map((e) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showNewsInfo(e);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: screenWidth(context),
                            height: 100,
                            color: Colors.white,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: NetworkImage(e.urlImage),
                                    width: 100,
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                      child: Text(
                                    e.title ?? "",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    )));
  }
}
