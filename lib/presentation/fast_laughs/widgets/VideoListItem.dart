import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/FastLaugh_Bloc/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/downloads/model.dart';

class VideoListInheritedWidget extends InheritedWidget {
  final Downloads movieDetails;
  final Widget child;

  VideoListInheritedWidget({required this.movieDetails, required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant VideoListInheritedWidget oldWidget) {
    return oldWidget.movieDetails != movieDetails;
  }

  static VideoListInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  GlobalKey<_FastLaughVideoPlayerState> videoPlayerKey=GlobalKey<_FastLaughVideoPlayerState>();
  
  final int index;
   VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FastLaughVideoPlayer(key: videoPlayerKey,
        videoURL: videoURLs[index % videoURLs.length], 
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left Side

                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(.7),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      videoPlayerKey.currentState?.toggleMuteUnmute();
                    },
                    icon: Icon(Icons.volume_off),
                  ),
                ),

                // Right Side
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${VideoListInheritedWidget.of(context)?.movieDetails.posterPath}'),
                      ),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: LikedVideoIdsNotifier,
                        builder: (BuildContext, Set<int> likednotilist, Widget?_) {

                            final _index=index;
                          if (likednotilist.contains(_index)) {
                             return   GestureDetector(
                              onTap: (){
                                LikedVideoIdsNotifier.value.remove(_index);
                                LikedVideoIdsNotifier.notifyListeners();
                                // context.read<FastLaughBloc>().add(FastLaughEvent.unlikeVideo(Id: _index));
                              },
                               child: VideoActionWidget(iconwidget: Icon(Icons.emoji_emotions_rounded,color:Colors.blue,), text: Text('LOL',style: TextStyle(color: Colors.blue),),),
                             );
                          }
                          return   GestureDetector(
                            onTap: (){
                               LikedVideoIdsNotifier.value.add(_index);
                                LikedVideoIdsNotifier.notifyListeners();
                            },
                            child: VideoActionWidget(
                             iconwidget: Icon(Icons.emoji_emotions_outlined,color:ButtonColorWhite), text: Text('LOL',)),
                          );
                        } ,
                       
                      ),
                      kHeight,
                      VideoActionWidget(iconwidget: Icon(Icons.add,color:ButtonColorWhite,), text:Text('My List')),
                      kHeight,
                      GestureDetector(onTap: (){
                          log('Share Clicked');
                          final movie=videoURLs[index];
                          if (movie!=null) {
                            log(movie.toString());
                            Share.share(movie);
                          }

                      },child: VideoActionWidget(iconwidget: Icon(Icons.share,color:ButtonColorWhite), text: Text('Share'))),
                      kHeight,
                      GestureDetector(
                        onTap: (){
                          // Pause And Play impl
                              videoPlayerKey.currentState?.togglePlayPause();
                        },
                        child: VideoActionWidget(
                            iconwidget: Icon(Icons.play_arrow,color:ButtonColorWhite), text: Text('Play')),
                      ),
                      kHeight
                    ],
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

class VideoActionWidget extends StatelessWidget {
  final Color? color;
  final Widget iconwidget;
  final Text text;
  const VideoActionWidget({super.key, required this.iconwidget, required this.text, this.color,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
          iconwidget ,
          
    
       text,
      ],
    );
  }
}


// Video player Widget belo


class FastLaughVideoPlayer extends StatefulWidget {

  final String videoURL;
  
  const FastLaughVideoPlayer({super.key, required this.videoURL, });

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {

  late VideoPlayerController vidoeplayerController;
  // bool _isPlaying = true;
  @override
  void initState() {
     super.initState();


     InititialiseVideo();
  
   
  }
  Future InititialiseVideo()async{
    vidoeplayerController= VideoPlayerController.network(widget.videoURL);
   await vidoeplayerController.initialize().then((_){
      setState(() {
        
      });   
      
       vidoeplayerController.setLooping(true);
      vidoeplayerController.play();
      vidoeplayerController.setVolume(1.0);
});
    
  }
  void togglePlayPause(){
    if (vidoeplayerController.value.isPlaying) {
      vidoeplayerController.pause();

    }else{
      vidoeplayerController.play();
    }
  }

  void toggleMuteUnmute(){
    if (vidoeplayerController.value.volume==1.0) {
      vidoeplayerController.setVolume(0.0);

    }
    else{
      vidoeplayerController.setVolume(1.0);
    }
  }
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child:vidoeplayerController.value.isInitialized?
       AspectRatio(aspectRatio: vidoeplayerController.value.aspectRatio,
       child: VideoPlayer(vidoeplayerController),)
       : Center(child:CircularProgressIndicator(color: Colors.grey,)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vidoeplayerController.dispose();
  }
}

