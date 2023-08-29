import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot&new_service.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot_and_new_resp/hot_and_new_resp.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';

part 'hot_new_event.dart';
part 'hot_new_state.dart';
part 'hot_new_bloc.freezed.dart';

class HotAndNewBloc extends Bloc<HotAndNewEvent, HoAndNewState> {
  final HotAndNewService hotAndNewService;

  HotAndNewBloc(this.hotAndNewService) : super(HoAndNewState.initial()) {
    on<_LoadDataInComingsoon>((event, emit) async {
      // following emit is to send loading on ui
      emit(HoAndNewState(
          ComingSoonList: [],
          EeveryOnesWatchingList: [],
          isError: false,
          isLoading: true));



      final _result1 = await hotAndNewService.getHotAndNewMovieData();
      _result1.fold((MainFailure failed) {
        emit(
          HoAndNewState(
              ComingSoonList: [],
              EeveryOnesWatchingList: [],
              isError: true,
              isLoading: false),
        );
      }, (HotAndNewResp Success) {
        emit(
          HoAndNewState(
              ComingSoonList: Success.results,
              EeveryOnesWatchingList: state.EeveryOnesWatchingList,
              isError: true,
              isLoading: false),
        );
      });
    });

    on<_LoadDataInEveryonesWatching>((event, emit) async {
      // following is to show loading on ui
      emit(HoAndNewState(
          ComingSoonList: [],
          EeveryOnesWatchingList: [],
          isError: false,
          isLoading: true));



      final _reslut2 = await hotAndNewService.getHotAndNewTvData();
      _reslut2.fold((MainFailure failed) {
        emit(
          HoAndNewState(
              ComingSoonList: [],
              EeveryOnesWatchingList: [],
              isError: true,
              isLoading: false),
        );
      }, (HotAndNewResp succeed) {
        emit(
          HoAndNewState(
              ComingSoonList: [],
              EeveryOnesWatchingList: succeed.results,
              isError: false,
              isLoading: false),
        );
      });
    });
  }
}
