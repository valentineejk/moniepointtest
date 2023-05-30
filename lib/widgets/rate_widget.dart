import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final String rate;
  final String no;
  final double per;

  const RateWidget({
    Key? key,
    required this.rate,
    required this.no,
    required this.per,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Color(0xffEEA551),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(rate),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                20.0), // Set your desired border radius value
            color: Colors.grey,
          ),
          child: LinearProgressIndicator(
            value:
                per, // Set the value between 0.0 and 1.0 to indicate the progress
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff569C86)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(no),
      ],
    );
  }
}
