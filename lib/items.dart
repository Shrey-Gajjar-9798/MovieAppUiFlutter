import 'package:flutter/cupertino.dart';

class Item {
  final ImageProvider image;
  final ImageProvider bgimage;
  String name;
  String type;
  num rating;

  Item(
      {required this.image,
      required this.name,
      required this.bgimage,
      required this.rating,
      required this.type});
}
