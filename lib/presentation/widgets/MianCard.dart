import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
final String URl;
  const MainCard({
    super.key, required this.URl,
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
                URl),
            fit: BoxFit.cover),
      ),
    );
  }
}
