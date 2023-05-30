import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moniepointtest/constants/text_sty.dart';

import '../models/product_model.dart';
import '../widgets/action_icons.dart';
import '../widgets/product_widget.dart';
import '../widgets/rate_widget.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final List images;
  final String title;
  final double rate;
  final double price;
  final int sold;
  final List<ProductData> data;

  const ProductDetail({
    Key? key,
    required this.image,
    required this.images,
    required this.title,
    required this.rate,
    required this.price,
    required this.sold,
    required this.data,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  int _currentImg = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: Color(0xff494A59),
            ),
          ),
          const ActionIcons(
            icon: FaIcon(
              FontAwesomeIcons.bagShopping,
              color: Color(0xff494A59),
              size: 25,
            ),
            numb: '1',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        // height: 202,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        placeholder: 'assets/images/placehold.png',
                        placeholderFit: BoxFit.fitHeight,
                        // imageErrorBuilder: ,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Image.network('assets/images/placehold.png',
                              fit: BoxFit.cover);
                        },
                        image: widget.image,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      // height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // pageCtrl.animateToPage(index,
                                //     duration: const Duration(microseconds: 200),
                                //     curve: Curves.easeIn);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    // height: 202,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: 'assets/images/placehold.png',
                                    placeholderFit: BoxFit.fitHeight,
                                    // imageErrorBuilder: ,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.network(
                                          'assets/images/placehold.png',
                                          fit: BoxFit.cover);
                                    },
                                    image: widget.images[index],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //store name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.store,
                    color: Colors.grey,
                  ),
                  Text(
                    "tokubaju.id",
                    style: reg1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title,
                style: hev2,
              ),
            ),

            //ratings reviews sold
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffEEA551),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${widget.rate} Ratings • 2.3k+ Review • 2.5k+ Sold",
                    style: reg1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // about itetms and review
            DefaultTabController(
              length: 2,
              child: Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: const Color(0xff569C86),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: const Color(0xff569C86),
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          // icon: Icon(Icons.abc),
                          text: "About Item",
                        ),
                        Tab(
                          text: "Reviews",

                          // icon: Icon(Icons.abc),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5),
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Brand:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " Nike",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Color:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " Blue",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Category:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " Sportswear",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Condition:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " New",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Material:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " Cotton",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Heavy:",
                                  style: reg1,
                                  children: const [
                                    TextSpan(
                                      text: " 200 g",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        Container(
                          child: const Center(
                            child: Text("Reviews"),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            //description
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  descBullet(
                    desc:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ), //bullet text
                  descBullet(
                    desc:
                        'Aliquam luctus ipsum malesuada, aliquet massa quis, porttitor nibh.',
                  ),
                  descBullet(
                    desc: 'Quisque non dolor sit amet massa egestas eleifend.',
                  ),
                  descBullet(
                    desc: 'Nunc mattis tellus a ligula consectetur semper.',
                  ),
                  descBullet(
                    desc:
                        'Sed convallis velit at est pulvinar, pretium tempus nunc vehicula.',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vivamus iaculis orci sit amet quam faucibus, eget aliquet ipsum fringilla.',
                    style: reg1,
                  ),
                  Row(
                    children: [
                      Text(
                        "Show less",
                        style: reg2,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.grey,
                          ))
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //shippiing
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Information:",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Delivery:",
                        style: reg1,
                        children: const [
                          TextSpan(
                            text: "  Sed a erat sed felis volutpat.",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Shipping:",
                        style: reg1,
                        children: const [
                          TextSpan(
                            text: "  Sed a erat sed felis volutpat.",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text:
                        TextSpan(text: "Arrive:", style: reg1, children: const [
                      TextSpan(
                        text: "  Sed a erat sed felis volutpat.",
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //seller information
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seller Information:",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          child: Text(
                            "Nike",
                            style: hev2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nike Store",
                            style: hev1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Active 5 mins ago | 96.7% Positive Feedback",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .5),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              // foregroundColor: Colors.white,
                              side: const BorderSide(
                                color: Color(0xff569C86),
// Set your desired border color here
                                width: 2.0,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.store,
                                  size: 18,
                                  color: Color(0xff569C86),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  // "Check this out",
                                  "Visit Store",
                                  style: reg2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //reviews and rattings
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews & Ratings",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "4.9",
                                style: hev3,
                                children: const [
                                  TextSpan(
                                    text: "  / 5.0",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ]),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xffEEA551),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xffEEA551),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xffEEA551),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xffEEA551),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("2.3k + Reviews")
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RateWidget(
                            no: '1.5k',
                            per: 0.8,
                            rate: '5',
                          ),
                          RateWidget(
                            no: '710',
                            per: 0.4,
                            rate: '4',
                          ),
                          RateWidget(
                            no: '140',
                            per: 0.3,
                            rate: '3',
                          ),
                          RateWidget(
                            no: '10',
                            per: 0.2,
                            rate: '2',
                          ),
                          RateWidget(
                            no: '4',
                            per: 0.1,
                            rate: '1',
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews with images & videos",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            widget.images.length > 4 ? 4 : widget.images.length,
                        itemBuilder: (context, index) {
                          if (widget.images.length > 4 && index == 3) {
                            return Stack(children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                // color: Colors.amber,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    // height: 202,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: 'assets/images/placehold.png',
                                    placeholderFit: BoxFit.fitHeight,
                                    // imageErrorBuilder: ,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.network(
                                          'assets/images/placehold.png',
                                          fit: BoxFit.cover);
                                    },
                                    image: widget.images.last,
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: const Center(
                                    child: Text(
                                  "132+",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ]);
                          } else {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 60,
                                width: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    // height: 202,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: 'assets/images/placehold.png',
                                    placeholderFit: BoxFit.fitHeight,
                                    // imageErrorBuilder: ,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.network(
                                          'assets/images/placehold.png',
                                          fit: BoxFit.cover);
                                    },
                                    image: widget.images[index],
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //top rerviews
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Reviews:",
                        style: hev2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Showing 3 of 2.3k+ reviews",
                        style: reg1,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 30,
                  // ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      // foregroundColor: Colors.white,
//                       side: const BorderSide(
//                         color: Color(0xff569C86),
// // Set your desired border color here
//                         width: 2.0,
//                       ),
                      backgroundColor: Colors.grey[200],

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          // "Check this out",
                          "Popular",
                          style: hev2,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //comments
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage("assets/images/placehold.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Levi**Aren",
                            style: hev2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xffEEA551),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5.0",
                            style: hev2,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          "faucibus pellentesque.",
                          style: reg4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value to increase the border radius
                        ),
                        backgroundColor: Colors.green.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          "pellentesque.",
                          style: reg4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value to increase the border radius
                        ),
                        backgroundColor: Colors.green.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          "faucibus.",
                          style: reg4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value to increase the border radius
                        ),
                        backgroundColor: Colors.green.withOpacity(0.2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sed vitae elit laoreet, imperdiet sem ut.",
                    style: hev2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.thumb_up_alt,
                              color: Color(0xff569C86),
                            ),
                          ),
                          Text(
                            "Helpful ?",
                            style: reg2,
                          )
                        ],
                      ),
                      Text(
                        "Yesterday",
                        style: reg1,
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //pagination
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                      Text(
                        "1",
                        style: reg1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "2",
                        style: reg1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "3",
                        style: reg1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right),
                      )
                    ],
                  ),
                  Text(
                    "See more",
                    style: reg2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //recommendation
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: hev2,
                  ),
                  Text(
                    "See more",
                    style: reg2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //recom
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              margin: EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductData data = widget.data[index];

                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10),
                    child: Product(
                      title: data.title,
                      image: data.image,
                      category: data.category,
                      price: data.price,
                      rate: data.rating,
                      sold: data.sold,
                      tap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ProductDetail(
                        //           image: data.image,
                        //           images: data.images,
                        //           title: data.title,
                        //           sold: data.sold,
                        //           rate: data.rating,
                        //           price: data.price,
                        //         )));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Total price",
                  style: reg1,
                ),
                Text(
                  "\$${widget.price}",
                  style: hev4,
                ),
              ],
            ),
            Container(
              height: 60,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.amber,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 60,
                      width: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Color(0xff569C86),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bagShopping,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 60,
                      width: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color(0xff494A59),
                      ),
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container descBullet({required String desc}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const Text(
            "\u2022",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            width: 10,
          ), //space between bullet and text
          Expanded(
            child: Text(
              desc,
              style: reg1,
            ), //text
          )
        ],
      ),
    );
  }
}
