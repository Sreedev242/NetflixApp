import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/widget/video_widget.dart';
import 'package:netflix_app/presentation/new&hot/widget/EveryOnesWatchingWidget.dart';

import '../widgets/app_bar_widget.dart';
import 'widget/ComingSonWidget.dart';

class ScreenNewNHot extends StatelessWidget {
  const ScreenNewNHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: AppBar(
              title: Text(
                'New & Hot',
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
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
              bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: ButtonColorWhite,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ButtonColorWhite),
                tabs: [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: TabBarView(
              children: [
                buildComingSoon(context),
                buildEveryonesWatching(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

// FOLLOWING IS Coming soon Screen
  buildComingSoon(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext, int) {
        return ComingSoonWidget();
      },
    );
  }

  // FOLLOWING IS everyone's watching Screen
  buildEveryonesWatching(BuildContext context) {
    final Size x = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext, int) {
          return EveryOnesWatchingWidget(x: x);
        });
  }
}
