import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/application/FastLaugh_Bloc/fast_laugh_bloc.dart';
import 'package:netflix_app/application/Home/bloc/home_bloc_bloc.dart';
import 'package:netflix_app/application/Hot&New_Bloc/hot_new_bloc.dart';
import 'package:netflix_app/application/SearchBloc/search_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot_and_new_resp/hot_and_new_resp.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/search_service.dart';
import 'package:netflix_app/infrastructure/Hot&New/Hot&New_impl.dart';
import 'package:netflix_app/infrastructure/downloads/downloads_repository.dart';
import 'package:netflix_app/infrastructure/search/search_impl.dart';
import 'package:netflix_app/presentation/main_page/widgets/screen_main_page.dart';
import 'package:netflix_app/presentation/widgets/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DownloadsBloc(DownloadsRepo())),
        BlocProvider(
            create: (context) => SearchBloc(DownloadsRepo(), SearchImpl())),
        BlocProvider(create: (context) => FastLaughBloc(DownloadsRepo())),
         BlocProvider(create: (context) =>HotAndNewBloc(HotAndNewImplementation())),
         BlocProvider(create: (context) =>HomeBlocBloc(HotAndNewImplementation(),DownloadsRepo()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
              backgroundColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white))),
          home: SplashScreen()),
    );
  }
}
// ScreenMainPage()