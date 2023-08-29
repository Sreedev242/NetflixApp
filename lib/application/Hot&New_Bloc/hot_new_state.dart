part of 'hot_new_bloc.dart';

@freezed
class HoAndNewState with _$HoAndNewState {
  const factory HoAndNewState({
    required List<HotAndNewData>? ComingSoonList,
    required List<HotAndNewData>? EeveryOnesWatchingList,
    required bool isError,
    required bool isLoading,
  }) = _Initial;
  factory HoAndNewState.initial()=>HoAndNewState(
    ComingSoonList: [],
     EeveryOnesWatchingList: [], 
     isError: false, 
     isLoading: false);
}
