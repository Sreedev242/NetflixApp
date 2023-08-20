import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 28,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          color: Colors.white,
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          color: Colors.blue,
          width: 28,
          height: 28,
        )
      ],
    );
  }
}
