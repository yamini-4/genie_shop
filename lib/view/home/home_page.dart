import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genie/constants/constants.dart';
import 'package:genie/view/home/body.dart';

import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String? displayName = FirebaseAuth.instance.currentUser!.displayName;

  // late TabController _tabController;
  //
  // void initState() {
  //   super.initState();
  //   _tabController = new TabController(
  //     length: 2,
  //     vsync: this,
  //     initialIndex: 0,
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          appTitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.sort), Text("Sort")],
                    ),
                  ),
                ),
              ),
              Container(
                height: kToolbarHeight,
                width: 1,
                color: Colors.black12,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_alt_outlined),
                        Text("Filter")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
