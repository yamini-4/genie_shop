import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Shopping Cart"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border_rounded))
        ],
      ),
    );
  }
}
