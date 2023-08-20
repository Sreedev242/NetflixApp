import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/SearchBloc/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/search_resultScreen.dart';

import 'search_Screenidle.dart';

class ScreenSearch extends StatelessWidget {
   ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {

   
BlocProvider.of<SearchBloc>(context).add(SearchEvent.initialize());
     
    
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              style: TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              backgroundColor: Colors.grey.withOpacity(.5),
              onChanged: (searchingValue){
                if (searchingValue.isEmpty) {
                 return;
                }
               BlocProvider.of<SearchBloc>(context).add(SearchEvent.SearchMovie(movieQuery: searchingValue));
              },
            ),
            kHeight,
            // Expanded(child: SearchIdleScreen())
            Expanded(child:BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return SearchIdleScreen();
                }else{
                  return SearchResultScreen();
                }
              },
            )),
          ],
        ),
      ),
    ));
  }
}
