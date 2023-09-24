import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class Number_Card extends StatelessWidget {
  final int index;
  const Number_Card({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          SizedBox(
            width: 40,
            height: 150,
          ),
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(
                      'images/BackgroundImage.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      Positioned(
        top: 20,
        left: -6,
        child: BorderedText(
          child: Text(
            '${index + 1}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 110),
          ),
          strokeColor: Colors.white,
          strokeWidth: 3,
        ),
      )
    ]);
  }
}
