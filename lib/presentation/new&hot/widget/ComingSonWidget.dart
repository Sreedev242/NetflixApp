import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../Home/widget/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String? weekDay;
  final String? id;
  final String? month;
  final String? day;
  final String? poster_path;
  final String? movieName;
  final String? overview;
  const ComingSoonWidget({
    super.key,
   required this.id,
   required this.month,
   required this.day,
   required this.poster_path,
   required this.movieName,
   required this.overview, 
   required this.weekDay,
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
                '$month\n$day',
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
                VideoWidget(size: size,
                 Url:poster_path,),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(maxLines:1,
                      overflow:TextOverflow.clip,
                        '$movieName ',
                        style: TextStyle(
                          fontSize: 26,
                          letterSpacing: -2,
                        ),
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
                                  Icons.notifications_outlined,
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


                  child: Text('Coming on ${weekDay}'),
                ),
                kHeight,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '$movieName',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                kHeight,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(            
                     maxLines:3,
                    '$overview',
                    overflow: TextOverflow.clip,
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
