import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tests/widgets/home_widgets/catalog_header.dart';
import 'package:tests/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tests/models/catalog.dart';
import 'package:tests/widgets/drawer.dart';
import 'package:tests/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalog_json = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalog_json);
    var decodedData = jsonDecode(catalog_json);
    var productData = decodedData["products"];
    // print(productData);

    //List<Item> lists = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
