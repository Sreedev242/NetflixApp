import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laughs/screen_fast_laugh.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class BckgroundCard extends StatelessWidget {
  const BckgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('images/BackgroundImage.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  Text('My List')
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                    return ScreenFastLaughs();
                  }));
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.play_arrow_solid,
                      color: Colors.black,
                    ),
                    Text(
                      'Play',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(primary: ButtonColorWhite),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO
                    },
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text('Info')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
