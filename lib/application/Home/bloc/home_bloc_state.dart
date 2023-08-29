part of 'home_bloc_bloc.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({
       required List<Downloads> TrendingList,
    required List<HotAndNewData> HomeMovieList,
     required List<HotAndNewData> HomeTvList,
    required bool idLoading,
      required bool isError 
  }) = _Initial;

  factory HomeBlocState.initial()=> HomeBlocState(TrendingList: [],HomeTvList: [],HomeMovieList: [], idLoading: false, isError: false);
}
