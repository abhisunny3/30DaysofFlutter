import 'package:flutter/material.dart';
import 'package:tests/models/catalog.dart';
import 'package:tests/pages/home_detail_pager.dart';
import 'package:tests/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog)));
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key key,
    @required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: Catalogimage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 12)
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py16();
  }
}
