import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String? Url;
  const VideoWidget({
    super.key,
    required this.size,required this.Url,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  Url??''),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.7),
            radius: 20,
            child: IconButton(
              onPressed: () {
                // TODO
              },
              icon: Icon(Icons.volume_off),
            ),
          ),
        ),
      ],
    );
  }
}
