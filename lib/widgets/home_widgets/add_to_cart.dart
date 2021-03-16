import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/core/store.dart';
import 'package:tests/models/cart.dart';
import 'package:tests/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  //final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation
    ]); //  VxState.listen(context, to: [RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
            //isInCart = isInCart.toggle();
            //final _catalog = CatalogModel();
            //_cart.catalog = _catalog;
            //_cart.add(catalog);
            //setState(() {});
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
