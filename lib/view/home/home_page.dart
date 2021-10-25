import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genie/constants/constants.dart';

import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String? displayName = FirebaseAuth.instance.currentUser!.displayName;
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.add),
            ),
            Tab(
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("bnbns"),
          Text("sjhdsjhd"),
        ],
      ),
    );
  }
}
