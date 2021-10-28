import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  List<String> searchTag = [
    "shirts",
    "pants",
    "bags",
    "watches",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              hintText: "Search for products",
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_voice_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: SizedBox(
          height: 160,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Recent Searches"),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.clear))
                  ],
                ),
                Row(
                  children: searchTag
                      .map(
                        (e) => InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink),
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
