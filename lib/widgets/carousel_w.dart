import 'package:flutter/material.dart';

import '../constants/text_sty.dart';
import '../models/carosel_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselW extends StatelessWidget {
  CarouselData data;
  final List items;

  CarouselW({
    Key? key,
    required this.data,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // width: 100,
          // height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                data.imgUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 150,
            left: 20,
            right: 20,
          ),
          // height: 200,
          // width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "#FASHION DAY",
                      data.title,
                      style: hev2,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        // "80% OFF",
                        data.title2,
                        style: hev3,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        // "Discover fashion that suits to your style",
                        data.subtitle,
                        style: reg3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2B2D3F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        // "Check this out",
                        data.btnText,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 34,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 2,
              //     separatorBuilder: (BuildContext context, int index) {
              //       return const SizedBox(
              //         width: 4,
              //       );
              //     },
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         height: 10,
              //         width: 10,
              //         decoration: const BoxDecoration(
              //           // color: Color(0xffB4B9B6),
              //           color: Colors.blue,
              //           shape: BoxShape.circle,
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}
