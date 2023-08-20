import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.size,
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
                  'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/xHkOKPUe3ioXyPIe5odyL6o6cp4.jpg'),
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
              icon: Icon(Icons.volume_mute),
            ),
          ),
        ),
      ],
    );
  }
}
