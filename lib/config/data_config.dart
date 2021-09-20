import 'package:todaysecho/config/contents.dart';

class Data {
  final String? content, category, image, title;
  Data({this.content, this.category, this.image, this.title});
}

List<Data> data = [
  Data(
    content: psg,
    category: "Sports",
    image: "psg.jpg",
    title: "Rothen: \"Now I think signing Ramos was a bad idea for PSG\"",
  ),
  Data(
    content: prison,
    category: "Politices",
    image: "prison.jpg",
    title: "Mass Prison Break as Hundreds of Inmates Escape",
  ),
  Data(
    content: fox,
    category: "Entertainment",
    image: "fox.jpg",
    title: "Megan Fox Brought Back the Naked Look at the VMAs",
  ),
  Data(
    content: friends,
    category: "Entertainment",
    image: "friends.jpg",
    title:
        "Jennifer Aniston Responds to David Schwimmer Dating Rumors and 'Friends' Reunion's Emmy Noms (Exclusive)",
  )
];
