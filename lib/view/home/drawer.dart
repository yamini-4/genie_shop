import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genie/constants/constants.dart';
import 'package:genie/view/home/list_tiles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final String? displayName = FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
            child: UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    displayName!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              currentAccountPicture: CircleAvatar(
                child: Text("YAMI"),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              ListTiles(
                icon: Icons.category,
                title: category,
                index: 0,
                onSelected: (int value) {},
              ),
              ListTiles(
                icon: Icons.contact_support,
                title: faq,
                index: 1,
                onSelected: (int value) {},
              ),
              ListTiles(
                title: refer,
                index: 2,
                icon: Icons.card_giftcard,
                onSelected: (int value) {},
              ),
              ListTiles(
                title: offers,
                index: 3,
                icon: Icons.local_offer_rounded,
                onSelected: (int value) {},
              ),
              ListTiles(
                title: orders,
                index: 4,
                icon: Icons.local_shipping_rounded,
                onSelected: (int value) {},
              ),
              ListTiles(
                title: notification,
                index: 5,
                icon: Icons.notifications_active_rounded,
                onSelected: (int value) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5,
                    ),
                    child: InkWell(
                      child: Text(logout),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: InkWell(
                      child: Text(contactUs),
                      onTap: () {},
                    ),
                  ),
                  // Container(
                  //   width: 120,
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10.0,
                  //     vertical: 5,
                  //   ),
                  //   child: InkWell(
                  //     child: Text(privacy),
                  //     onTap: () {},
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
