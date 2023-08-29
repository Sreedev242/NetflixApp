import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Home/bloc/home_bloc_bloc.dart';
import 'package:netflix_app/application/Hot&New_Bloc/hot_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';

import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/BckgroundCard.dart';
import 'package:netflix_app/presentation/Home/widget/NumberTitleCard.dart';
import 'package:netflix_app/presentation/Home/widget/Number_Card.dart';

import 'package:netflix_app/presentation/widgets/Title.dart';

import '../widgets/MainTitleCard.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBlocBloc>().add(HomeBlocEvent.started());
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: ScrollNotifier,
      builder: (BuildContext, bool, Widget? _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              ScrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              ScrollNotifier.value = true;
            }
            return true;
          },
          child: SafeArea(
            child: Stack(children: [
              SingleChildScrollView(
                child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        BckgroundCard(),
                        kHeight,
                        MainTitleCard(

                          
                          PoaterList: state.HomeMovieList.map((e) =>'https://image.tmdb.org/t/p/w500${e.posterPath}').toList(),
                          title: 'Released in past year',
                        ),
                        kHeight,
                        MainTitleCard(
                          PoaterList: state.TrendingList.map((e) =>'https://image.tmdb.org/t/p/w500${e.posterPath}').toList(),
                          title: 'Trending Now',
                        ),
                        kHeight,
                        NumberTitleCard(),
                        MainTitleCard(
                          PoaterList: state.HomeTvList.map((e) => 'https://image.tmdb.org/t/p/w500${e.posterPath}').toList(),
                          title: 'Tense Drama',
                        ),
                        kHeight,
                        MainTitleCard(
                            PoaterList: state.HomeMovieList.map((e) =>'https://image.tmdb.org/t/p/w500${e.posterPath}').toList(),
                          title: 'South Indian Cinema',
                        ),
                        kHeight,
                      ],
                    );
                  },
                ),
              ),
              ScrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 65,
                      color: Colors.black.withOpacity(.2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://blog.ventunotech.com/wp-content/uploads/2022/06/netflix-logo-circle-png-5.png',
                                width: 40,
                                height: 40,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.cast,
                                    color: ButtonColorWhite,
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 27,
                                height: 27,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text('Movies',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Text('Categories',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ]),
          ),
        );
      },
    ));
  }
}
