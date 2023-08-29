import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Home/bloc/home_bloc_bloc.dart';
import 'package:netflix_app/core/constants.dart';

import 'MianCard.dart';
import 'Title.dart';

class MainTitleCard extends StatelessWidget {
  final List<String> PoaterList;
  final String title;
  const MainTitleCard({
    required this.PoaterList,
    required this.title,
    super.key, 
  
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: title),
              kHeight,
              LimitedBox(
                maxHeight: 150,
                child: ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return MainCard(
                            URl:PoaterList[index] ,
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return SizedBox(
                            width: 7,
                          );
                        },
                        itemCount:PoaterList.length)),
              ),
            ],
          ),
        );
      },
    );
  }
}
