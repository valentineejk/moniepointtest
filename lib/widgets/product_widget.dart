import 'package:flutter/material.dart';

import '../constants/text_sty.dart';

class Product extends StatefulWidget {
  final String title;
  final String image;
  final String category;
  final double rate;
  final int sold;
  final double price;
  final VoidCallback tap;

  const Product({
    Key? key,
    required this.title,
    required this.image,
    required this.category,
    required this.rate,
    required this.sold,
    required this.price,
    required this.tap,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool like = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tap,
      onTapDown: (details) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isTapped
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(alignment: Alignment.topRight, children: [
                FadeInImage.assetNetwork(
                  // height: 202,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/placehold.png',
                  placeholderFit: BoxFit.fitHeight,
                  // imageErrorBuilder: ,
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.network('assets/images/placehold.png',
                        fit: BoxFit.cover);
                  },
                  image: widget.image,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        like = !like;
                      });
                    },
                    icon: like
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                          ))
              ]),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.category,
                      style: reg1,
                    ),
                    Text(
                      widget.title,
                      style: hev2,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                              "${widget.rate} | ${widget.sold}",
                              style: reg1,
                            ),
                          ],
                        ),
                        Text(
                          "\$${widget.price}",
                          style: reg2,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
