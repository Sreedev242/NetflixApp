import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/search_service.dart';
import 'package:netflix_app/domain/search/model/search_resp/search_resp.dart';

import '../../domain/downloads/model.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final iDownloadsRepo _downloadsService;
  final SearchService _searchService;

  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    // Idle state of searchScreen

    on<_Initialize>((event, emit) async {
      emit(
        SearchState(
            idleList: [],
            searchResultList: [],
            isLoading: true,
            isError: false),
      );
      //* get trending movies data

      final _result = await _downloadsService.getDownloadsImage();
      _result.fold((MainFailure F) {
        emit(
          SearchState(
              idleList: [],
              searchResultList: [],
              isLoading: false,
              isError: true),
        );
      }, (List<Downloads> list) {
        emit(
          SearchState(
              idleList: list,
              searchResultList: [],
              isLoading: false,
              isError: false),
        );
      });
      //Show to ui
    });





    //* searchScreen when we searcgh for Movie

    on<_SearchMovie>((event, emit)async {
      // call API

       emit(
          SearchState(
              idleList: [],
              searchResultList: [],
              isLoading: true,
              isError: false),
        );
      final _x=await _searchService.searchMovies(movieQuery: event.movieQuery);
      // print(x);
    
      _x.fold((MainFailure F) {
         emit(
          SearchState(
              idleList: [],
              searchResultList: [],
              isLoading: false,
              isError: true),
        ); 
      }, (SearchResp success) {
         emit(
          SearchState(
              idleList: [],
              searchResultList:success.results,
              isLoading: false,
              isError: false),
        );
      });
      //show to ui
    });
  }
}
