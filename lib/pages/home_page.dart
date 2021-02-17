import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tests/models/catalog.dart';
import 'package:tests/widgets/drawer.dart';
import 'package:tests/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.deepPurple),
                              child: Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              )),
                          footer: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: Colors.black),
                              child: Text(
                                item.price.toString(),
                                style: TextStyle(color: Colors.white),
                              )),
                          child: Image.network(item.image)));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
