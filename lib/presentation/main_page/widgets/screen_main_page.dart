import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_downloads.dart';

import 'package:netflix_app/presentation/fast_laughs/screen_fast_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottm_nav.dart';
import 'package:netflix_app/presentation/new&hot/screen_new&hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _Pages = [
    ScreenHome(),
    ScreenNewNHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexNavNotifier,
          builder: (context, index, child) {
            return _Pages[index];
          },
        ),
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
