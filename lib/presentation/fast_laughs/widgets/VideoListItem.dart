import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/FastLaugh_Bloc/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
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
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FastLaughVideoPlayer(videoURL: videoURLs[index % videoURLs.length], onStateChanged: (bool){}),
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
                    onPressed: () {},
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
                      VideoActionWidget(
                          icon: Icons.emoji_emotions, text: 'LOL'),
                      kHeight,
                      VideoActionWidget(icon: Icons.add, text: 'My List'),
                      kHeight,
                      VideoActionWidget(icon: Icons.share, text: 'Share'),
                      kHeight,
                      VideoActionWidget(
                          icon: CupertinoIcons.play_arrow, text: 'Play'),
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
  final IconData icon;
  final String text;
  const VideoActionWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: ButtonColorWhite,
        ),
        Text(text)
      ],
    );
  }
}


// Video player Widget belo


class FastLaughVideoPlayer extends StatefulWidget {

  final String videoURL;
  final Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer({super.key, required this.videoURL, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {

  late VideoPlayerController _vidoeplayerController;

  @override
  void initState() {
     super.initState();
    // ignore: deprecated_member_use
    _vidoeplayerController=VideoPlayerController.networkUrl(Uri.parse(widget.videoURL) )
   ..initialize().then((_){

    setState(() {  });
        
      _vidoeplayerController.setLooping(true);
      _vidoeplayerController.play();
      
      
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child:_vidoeplayerController.value.isInitialized ?
       AspectRatio(aspectRatio: _vidoeplayerController.value.aspectRatio,
       child: VideoPlayer(_vidoeplayerController),)
       : Center(child:CircularProgressIndicator(color: Colors.grey,)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _vidoeplayerController.dispose();
  }
}