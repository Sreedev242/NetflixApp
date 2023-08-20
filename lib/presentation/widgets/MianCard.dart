import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/fXgY2RCzoIJPhPDoyKRjaaqjIZs.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
