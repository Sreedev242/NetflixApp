import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/model.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';


class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final iDownloadsRepo downloadsRepo;
  DownloadsBloc(this.downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      // TODO: implement event handler
      emit(
        state.copyWith(
          isLoading: true,
       isErrorDown: false,
        ),
      );

      final  downloadsOption =
          await downloadsRepo.getDownloadsImage();
      // log(downloadsOption.toString());
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            isErrorDown: true,
          ),
          (success) => state.copyWith(
              isLoading: false,
             isErrorDown: false,
              downloads: success),
        ),
      );
    });
  }
}
