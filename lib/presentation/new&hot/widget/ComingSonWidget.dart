import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widget/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 500,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Feb\n 11',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: size.width - 55,
            height: 440,
            child: Column(
              children: [
                VideoWidget(size: size),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Movie Name',
                      style: TextStyle(
                        fontSize: 26,
                        letterSpacing: -2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: ButtonColorWhite,
                                  size: 18,
                                ),
                              ),
                              Text(
                                'Remind Me',
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.info_outline,
                                    color: ButtonColorWhite, size: 18),
                              ),
                              Text(
                                'Info',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                kHeight,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Coming on Friday'),
                ),
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
