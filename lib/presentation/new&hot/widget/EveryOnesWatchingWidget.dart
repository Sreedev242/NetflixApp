import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widget/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({
    super.key,
    required this.x,
  });

  final Size x;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight,
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Movie Name',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        kHeight,
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'hifhaishfo iafiha ihjihj iaifhoa ihaioh oaihsf  haoih foaihfaoih foaih sfdoiah foaihdfoihaoshidfoihasoidhoahosihdohaoihd ',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWidget(
          size: x,
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: ButtonColorWhite,
                    size: 25,
                  ),
                ),
                Text(
                  'Share',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: ButtonColorWhite, size: 25),
                ),
                Text(
                  'My List',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.play_arrow, color: ButtonColorWhite, size: 25),
                ),
                Text(
                  'Play',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
