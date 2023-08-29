import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

import '../../core/colors/colors.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DownloadsBloc>().add(DownloadsEvent.getDownloadsImage());

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(45),
            child: AppBarWidget(
              title: 'Downloads',
            ),
          ),
          body: ListView(
            children: [
              kHeight,
              _SmartDownloads(),
              kHeight,
              Text(
                'Indroducing Downloads for you',
                style: TextStyle(
                  color: ButtonColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              kHeight,
              Text(
                'We will download personalised selection of\n movies and shows for you,so there is always something to watch on your\ndevice',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2,
              ),
              BlocBuilder<DownloadsBloc, DownloadsState>(
                builder: (context, state) {

                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator(color: Colors.grey,),);
                  }
                  if (state.isErrorDown) {
                    return Center(child: Text('Error occured',style: TextStyle(color: Colors.grey),),);
                  }
                  return SizedBox(
                    width: size.width,
                    height: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * .32,
                          backgroundColor: Color.fromARGB(218, 158, 158, 158)
                              .withOpacity(.5),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              'https://image.tmdb.org/t/p/w500${state.downloads[1].posterPath}',
                          angle: 17,
                          margin: EdgeInsets.only(left: 150, bottom: 40),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              'https://image.tmdb.org/t/p/w500${state.downloads[2].posterPath}',
                          angle: -17,
                          margin: EdgeInsets.only(right: 150, bottom: 40),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              'https://image.tmdb.org/t/p/w500${state.downloads[0].posterPath}',
                          angle: 0,
                          margin: EdgeInsets.only(),
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: MaterialButton(
                    onPressed: () {
                      // TODO
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'Set up',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ButtonColorWhite),
                      ),
                    ),
                    color: Color.fromARGB(255, 65, 61, 183)),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                    onPressed: () {
                      // TODO
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'See what you can download',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    color: ButtonColorWhite),
              ),
            ],
          )),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        SizedBox(width: 15),
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      required String imageList,
      this.angle = 0,
      required this.margin})
      : _imageList = imageList;

  final String _imageList;
  final double angle;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.29,
        height: size.width * .39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(_imageList),
          ),
        ),
      ),
    );
  }
}
