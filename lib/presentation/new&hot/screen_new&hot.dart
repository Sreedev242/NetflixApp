import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/Hot&New_Bloc/hot_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/strings.dart';
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
                ComingSoonList(),
                EeveryOnesWatchingList()
              ],
            ),
          ),
        ),
      ),
    );
  }


}

// FOLLOWING IS Coming soon Screen

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
 context
            .read<HotAndNewBloc>()
            .add(HotAndNewEvent.LoadDataInComingsoon());

    return RefreshIndicator(
      onRefresh: () async{
        return context
            .read<HotAndNewBloc>()
            .add(HotAndNewEvent.LoadDataInComingsoon());
      },
      child: BlocBuilder<HotAndNewBloc, HoAndNewState>(
        builder: (context, state) {
         
    
          if (state.isError) {
            Center(
              child: Text('Error Occured',
                  style: TextStyle(color: Colors.grey, fontSize: 22)),
            );
          } else if (state.isLoading) {
            Center(
              child:
                  CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
            );
          }
          return ListView.builder(
              itemCount: state.ComingSoonList!.length,
              itemBuilder: (BuildContext, int) {
                final _movie=state.ComingSoonList?[int];
    
                final _formatedDate=DateFormat.yMMMd().format(DateTime.parse(_movie?.releaseDate??''));
                  final _weekday=DateFormat.EEEE().format(DateTime.parse(_movie?.releaseDate??''));
    
    
                return ComingSoonWidget(
    
                  weekDay: _weekday,
                    id: _movie?.id.toString(),
                    month:_formatedDate.split(" ").first,
                    day: _formatedDate.split(" ").elementAt(1),
                    poster_path:'https://image.tmdb.org/t/p/w500${ _movie?.posterPath}',
                    movieName: _movie?.originalTitle,
                    overview: _movie?.overview);
              });
        },
      ),
    );
  }
}

class EeveryOnesWatchingList extends StatelessWidget {
  const EeveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
 context.read<HotAndNewBloc>().add(HotAndNewEvent.LoadDataInEveryonesWatching());
            
            
            final Size x = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: ()async {
        return context.read<HotAndNewBloc>().add(HotAndNewEvent.LoadDataInEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HoAndNewState>(
        builder: (context, state) {
         
    
          if (state.isError) {
            Center(
              child: Text('Error Occured',
                  style: TextStyle(color: Colors.grey, fontSize: 22)),
            );
          } else if (state.isLoading) {
            Center(
              child:
                  CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
            );
          }
          return ListView.builder(
              itemCount: state.EeveryOnesWatchingList!.length,
              itemBuilder: (BuildContext, index) {
                final _movie=state.EeveryOnesWatchingList?[index];
    
    
                return EveryOnesWatchingWidget(
                    x:x ,
                    ShereLink: _movie!.posterPath?[index],
                    poster_path:'https://image.tmdb.org/t/p/w500${ _movie?.posterPath}',
                    movieName: _movie?.originaltvName,
                    overview: _movie?.overview);
              });
        },
      ),
    );
  }
}