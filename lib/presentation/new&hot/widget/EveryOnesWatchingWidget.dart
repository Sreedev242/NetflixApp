import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widget/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String? ShereLink;
    final String? poster_path;
  final String? movieName;
  final String? overview;
  const EveryOnesWatchingWidget({
    super.key,
    required this.x, 
   required this.poster_path, 
   required this.movieName, 
   required this.overview, 
   this.ShereLink,
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
            movieName??'Title is not available',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        kHeight,
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            maxLines:4,
            overflow:TextOverflow.clip,
            overview??"Description isn't available",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWidget(
          size: x, 
          Url: poster_path,
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
                  onPressed: () {
                    final shareLink=ShereLink;
                Share.share(shareLink!);
                  },
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
