// import 'package:flutter/material.dart';
// import 'package:genie/model/products.dart';
//
// class Body extends StatefulWidget {
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
//   List<String> categories = [
//     "Dresses",
//     "Bags",
//     "Jewellery",
//     "Footwear",
//     "Ethnic",
//     "Skin",
//   ];
//
//   List<Product> products = [
//     Product(
//       name: 'Women Maroon Hand-held Bag',
//       previewImg:
//           'https://rukminim1.flixcart.com/image/880/1056/kskotjk0/sling-bag/e/i/r/sb00h-hr-smart-a1h-sling-bag-sxf-speed-x-fashion-original-imag63x9y5azgysu.jpeg?q=50',
//       price: 450.95,
//       category: 'Bags',
//     ),
//     Product(
//       name: 'Women Fit and Flare Green Dress',
//       previewImg:
//           'https://rukminim1.flixcart.com/image/880/1056/ks243gw0/dress/k/a/x/s-frock-11-gg-fashion-original-imag5phymtcebr7p.jpeg?q=50',
//       price: 250.95,
//       category: 'Dresses',
//     ),
//   ];
//
//   late TabController _tabController;
//
//   List<Product> temp = [];
//
//   void initState() {
//     super.initState();
//     _tabController = new TabController(
//       length: categories.length,
//       vsync: this,
//       initialIndex: 0,
//     );
//
//     String cat = categories[0];
//     temp = products.where((element) => cat == element.category).toList();
//   }
//
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TabBar(
//             onTap: (index) {
//               String cat = categories[index];
//               temp =
//                   products.where((element) => cat == element.category).toList();
//
//               setState(() {});
//             },
//             labelColor: Colors.black,
//             controller: _tabController,
//             isScrollable: true,
//             tabs: categories.map((e) => Tab(text: e)).toList(),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: temp.length,
//             itemBuilder: (context, index) {
//               Product product = temp[index];
//               return ListTile(
//                 leading: Image.network(product.previewImg),
//                 title: Text(
//                   product.name,
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:genie/model/products.dart';

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  List<String> categories = [
    "Dresses",
    "Ethnic",
    "Bags",
    "Jewellery",
    "Footwear",
    "Skin",
    "Accessories",
    "Lounge wear"
  ];
  List<Product> products = [
    Product(
        name: "Athena",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13719160/2021/3/5/b04a5dc0-9beb-4490-ae2c-f0f9654ded1c1614925067822-Athena-Fuchsia-Pink-dress-with-Power-shoulderS--Tulip-Bottom-1.jpg",
        price: 1120,
        category: "Dresses"),
    Product(
        name: "Athena",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/20/e05fb40e-0c63-4da0-a514-672b42bae8cd1574191969626-1.jpg",
        price: 920,
        category: "Dresses"),
    Product(
        name: "Sassafras",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/8643281/2019/2/1/563a4cec-e24f-42bd-ae3f-8ad877b40c051549024712622-SASSAFRAS-Women-Off-White-Printed-Maxi-Dress-750154902471183-1.jpg",
        price: 920,
        category: "Dresses"),
    Product(
        name: "Mish",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13634034/2021/2/27/fe9956cf-39ca-4e2e-bcc6-d2d23a4b32ea1614421150816-MISH-Women-Dresses-9681614421148904-1.jpg",
        price: 1500,
        category: "Dresses"),
    Product(
        name: "VENI VIDI",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10054821/2019/7/3/db52fd6a-19fc-4add-bc4b-77b8608454d01562138455279-Veni-Vidi-Vici-Women-Black-Bodycon-Dress-3841562138453419-1.jpg",
        price: 480,
        category: "Dresses"),
    Product(
        name: "Antheaa",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11537380/2020/2/27/5ab6cfa9-d952-4ec3-87f3-77caf8f1761b1582781144384-Antheaa-Women-Dresses-5921582781143098-1.jpg",
        price: 540,
        category: "Dresses"),
    Product(
        name: "Anouk",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13791594/2021/3/22/befc45f5-b214-4ff4-8138-fb911f6bc2af1616412038099-Anouk-Women-Kurta-Sets-8481616412037272-1.jpg",
        price: 780,
        category: "Ethnic"),
    Product(
        name: "Indo Era",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11459658/2020/2/15/9b7f8d3f-e48f-4618-8eac-32cee1a0d4111581757541745-Indo-Era-Maroon-Floral-Printed-A-Line-Kurta-with-Palazzo-Set-1.jpg",
        price: 1350,
        category: "Ethnic"),
    Product(
        name: "Gerua",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10178863/2019/7/8/fcc8c908-2c14-43da-97d6-bc2319ad65e51562590193174-GERUA-Women-Rust--Gold-Toned-Printed-Kurta-with-Trousers-489-1.jpg",
        price: 570,
        category: "Ethnic"),
    Product(
        name: "Jaipur Kurti",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10717938/2019/11/13/d1a5a686-71d2-4a92-93dc-a430b657c14e1573631419369-Jaipur-Kurti-Women-Kurta-Sets-1191573631415387-1.jpg",
        price: 430,
        category: "Ethnic"),
    Product(
        name: "Libas",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9329399/2019/4/24/8df4ed41-1e43-4a0d-97fe-eb47edbdbacd1556086871124-Libas-Women-Kurtas-6161556086869769-1.jpg",
        price: 637,
        category: "Ethnic"),
    Product(
        name: "Sangria",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/8349861/2021/4/6/f82a09ff-1ed2-4aab-9109-3ba97bd2bfd81617706880023-Sangria-Women-Red-Solid-Anarkali-Kurta-8711617706878825-1.jpg",
        price: 1600,
        category: "Ethnic"),
    Product(
        name: "Caprese",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10486150/2020/1/22/be7af425-bebf-41bb-813e-7d469ca20dae1579695442570-Caprese-Light-Maroon-Textured-Sling-Bag-9901579695439357-1.jpg",
        price: 1380,
        category: "Bags"),
    Product(
        name: "Lapis O Lupo",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/12295058/2021/9/11/34131598-238a-43c5-9014-0af27fea0e141631336740288-Lapis-O-Lupo-Turquoise-Blue-Solid-Handheld-Bag-5361631336740-7.jpg",
        price: 1890,
        category: "Bags"),
    Product(
        name: "Allen Solly",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/15513588/2021/9/30/3bc0e1a6-5fe3-48eb-9078-7eb21160fb341632988036762-Allen-Solly-Women-Handbags-7061632988035917-2.jpg",
        price: 2100,
        category: "Bags"),
    Product(
        name: "Mango",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/15102936/2021/9/10/6f0ced32-82bd-41c7-a4f0-198502b53f061631269359946FlatsMANGOWomenHeelsMANGOWomenHeelsMANGOWomenHeelsMANGOWomen1.jpg",
        price: 1320,
        category: "Bags"),
    Product(
        name: "Mast&Harbor",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/12898258/2021/7/20/a44caa6d-f000-40d8-82dd-3ce2bfa1a8fa1626780402598-Mast--Harbour-Women-Backpacks-4591626780401869-1.jpg",
        price: 750,
        category: "Bags"),
    Product(
        name: "Street 9",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2020/10/18/751db3e9-b66c-408a-bde9-d9ef7cd2dbe71602979949502-1.jpg",
        price: 980,
        category: "Bags"),
    Product(
        name: "NR Clutches",
        previewImg:
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/15614406/2021/9/25/5fd3e059-b5b6-4fb2-9fc0-37916cb446411632557453788Clutches1.jpg",
        price: 340,
        category: "Bags"),
  ];
  List<Product> temp = [];
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(
        length: categories.length, vsync: this, initialIndex: 0);

    temp =
        products.where((element) => categories[0] == element.category).toList();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            onTap: (index) {
              temp = products
                  .where((element) => categories[index] == element.category)
                  .toList();
              setState(() {});
            },
            tabs: categories.map((e) => Tab(text: e)).toList(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 0.90,
              ),
              itemCount: temp.length,
              itemBuilder: (context, index) {
                Product product = temp[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          height: 165,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                          ),
                          child: Image.network(
                            product.previewImg,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 12, color: Colors.black45)),
                          ),
                          Text(
                            "\₹ ${product.price.toStringAsFixed(0)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline_sharp),
                            iconSize: 18,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
