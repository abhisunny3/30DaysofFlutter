import 'package:flutter/material.dart';
import 'package:tests/models/catalog.dart';
import 'package:tests/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogimage extends StatelessWidget {
  final String image;

  const Catalogimage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
