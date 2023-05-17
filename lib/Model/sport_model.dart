import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'BasketBall',
    'FootBall',
    'VolleyBall',
    'BaseBall',
    'CricketBall',
    'Cricket Bat',
    'SportShoes',
    'Sport Pant',
    'Sport T-shirt',
    'Table Tennis',
    'Carrem Board',
    'Ludo',
    'Badminton',
    'Hockey',
  ];

  static List<Image> imageData = [
    Image.asset("Assets/Images/badminton.jpeg"),
    Image.asset("Assets/Images/baseball.jpeg"),
    Image.asset("Assets/Images/basketball.png"),
    Image.asset("Assets/Images/carromboard.png"),
    Image.asset("Assets/Images/CricketBall.jpeg"),
    Image.asset("Assets/Images/cricketbat.jpeg"),
    Image.asset("Assets/Images/football.jpeg"),
    Image.asset("Assets/Images/hockey.jpeg"),
    Image.asset("Assets/Images/ludo.png"),
    Image.asset("Assets/Images/sportjacket.png"),
    Image.asset("Assets/Images/sportshoes.jpg"),
    Image.asset("Assets/Images/sporttrack.jpeg"),
    Image.asset("Assets/Images/tabletennies.png"),
    Image.asset("Assets/Images/volleyball.jpeg"),
  ];

  Item getById(int id) =>
      Item(id, itemNames[id % itemNames.length],
          imageData[id % imageData.length]);

  // Get item by its position in the catalog.
  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Image imageData;
  final int price = 42;

  Item(this.id, this.name, this.imageData);

  //: color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
