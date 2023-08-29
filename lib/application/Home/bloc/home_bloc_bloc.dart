import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot&new_service.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot_and_new_resp/hot_and_new_resp.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';
part 'home_bloc_bloc.freezed.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final HotAndNewService _hotAndNewService;
  final iDownloadsRepo _downloadsRepo;

  HomeBlocBloc(this._hotAndNewService, this._downloadsRepo)
      : super(HomeBlocState.initial()) {
    on<_Started>((event, emit) async {
      //  send loading to ui
      emit(HomeBlocState(
          TrendingList: [],
          HomeMovieList: [],
          HomeTvList: [],
          idLoading: true,
          isError: false));

      final _result1 = await _downloadsRepo.getDownloadsImage();

      _result1.fold((fail) {
        emit(HomeBlocState(
            TrendingList: [],
            HomeMovieList: state.HomeMovieList,
            HomeTvList: state.HomeTvList,
            idLoading: false,
            isError: true));
      }, (response) {
        emit(HomeBlocState(
            TrendingList: response,
            HomeMovieList: state.HomeMovieList,
            HomeTvList: state.HomeTvList,
            idLoading: false,
            isError: false));
      });

      final _result2 = await _hotAndNewService.getHotAndNewMovieData();
      _result2.fold((l) {
        emit(HomeBlocState(
            TrendingList: state.TrendingList,
            HomeMovieList: [],
            HomeTvList: state.HomeTvList,
            idLoading: false,
            isError: true));
      }, (r) {
        emit(HomeBlocState(
            TrendingList: state.TrendingList,
            HomeMovieList: r.results!,
            HomeTvList: state.HomeTvList,
            idLoading: false,
            isError: false));
      });

      final _reslut3 = await _hotAndNewService.getHotAndNewTvData();

      _reslut3.fold((l) {
        HomeBlocState(
            TrendingList: state.TrendingList,
            HomeMovieList: state.HomeMovieList,
            HomeTvList: [],
            idLoading: false,
            isError: true);
      }, (r) {
        emit(HomeBlocState(
            TrendingList: state.TrendingList,
            HomeMovieList: state.HomeMovieList,
            HomeTvList: r.results!,
            idLoading: false,
            isError: false));
      });
    });
  }
}
