import 'package:tests/models/cart.dart';
import 'package:tests/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore() {
    catalog = new CatalogModel();
    cart = new CartModel();
    cart.catalog = catalog;
  }
}
