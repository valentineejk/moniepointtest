import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionIcons extends StatelessWidget {
  final FaIcon icon;
  final String numb;

  const ActionIcons({
    Key? key,
    required this.icon,
    required this.numb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(5),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            onPressed: () {},
            icon: icon,
          ),
          Container(
            padding: const EdgeInsets.all(1),
            // margin: EdgeInsets.all(1),
            height: 20,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffD56386),
            ),
            child: Center(
              child: Text(
                numb,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
