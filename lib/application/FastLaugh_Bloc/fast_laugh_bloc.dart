import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/model.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoURLs = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier <Set<int>> LikedVideoIdsNotifier=ValueNotifier({});


class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final iDownloadsRepo _downloadsRepo;

  FastLaughBloc(this._downloadsRepo) : super(FastLaughState.initial()) {
    on<_Initialize>((event, emit) async {
      // TODO: implement event handler

      // get trending movies & send to ui
      final _result = await _downloadsRepo.getDownloadsImage();

      emit(
        FastLaughState(
          VideoList: [],
          isLoading: true,
          isError: false, 
        
        ),
      );

      _result.fold((MainFailure f) {
        emit(
          FastLaughState(
              VideoList: [],
              isLoading: false,
              isError: true,
            
              ),
        );
      }, (response) {
        emit(
          FastLaughState(
              VideoList: response,
              isLoading: false,
              isError: false,   
          )
        );
      });
    });

    on<_LikeVideo>((event, emit) async {
      LikedVideoIdsNotifier.value.add(event.Id);
     
    });

    
    on<_UnlikeVideo>((event, emit) async {
    LikedVideoIdsNotifier.value.remove(event.Id);
    });

   
}
}