import 'package:flutter/material.dart';
import 'package:genie/view/cart/shopping_cart.dart';

class WishlistPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Wishlist"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_to_queue)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: Container(),
    );
  }
}
