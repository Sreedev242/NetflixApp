import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/SearchBloc/search_bloc.dart';

import '../../core/constants.dart';
import 'widgets/title.dart';

// final imageURL =
//     'https://www.themoviedb.org/t/p/w250_and_h141_face/hPea3Qy5Gd6z4kJLUruBbwAH8Rm.jpg';

class SearchIdleScreen extends StatelessWidget {
  const SearchIdleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: CircularProgressIndicator(color: Colors.grey,),);
              }  else if(state.isError){
                return Center(child: Text('Error occured!'));
              }else if(state.idleList.isEmpty)
              {
                return Center(child: Text('List is empty'));
              }

              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movieDetails=state.idleList[index];
                  return  TopSearchItemTile(
                    title: movieDetails.title??'no title is provided',
                   imageURL: movieDetails.posterPath??'');
                },
                separatorBuilder: ((context, index) {
                  return kHeight;
                }),
                itemCount: state.idleList.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
final String title;
final String imageURL;

  const TopSearchItemTile({super.key, required this.title, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: ScreenWidth * .34,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage('https://image.tmdb.org/t/p/w500${imageURL}'))),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
