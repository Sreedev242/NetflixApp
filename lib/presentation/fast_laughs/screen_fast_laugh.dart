import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/FastLaugh_Bloc/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/VideoListItem.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FastLaughBloc>().add(const FastLaughEvent.initialize());
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {

        if (state.isLoading) {
        return  Center(child: CircularProgressIndicator(color: Colors.grey,));

        } else if(state.isError)
        {
          return  Center(child: Text('error occured '));
        }

        else 
        {return PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(state.VideoList.length, (index) {
            return VideoListInheritedWidget(
              movieDetails: state.VideoList[index],
             child: VideoListItem(index: index,));
          }),
        );
        }
        
        
      },
    )));
  }


}
