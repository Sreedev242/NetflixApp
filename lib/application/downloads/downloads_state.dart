part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState(
      {required bool isLoading, //shows loading when fetching image
      required List<Downloads> downloads,
      required Option<Either<MainFailure, List<Downloads>>>
          downloadsFailureOrSuccessOption}) = _DownloadsState;

  factory DownloadsState.initial() {
    return DownloadsState(
        isLoading: false,
        downloadsFailureOrSuccessOption: None(),
        downloads: []);
  }
}
