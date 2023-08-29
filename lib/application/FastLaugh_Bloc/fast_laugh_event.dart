part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = _Initialize;

  const factory FastLaughEvent.likeVideo({required int Id}) = _LikeVideo;

  const factory FastLaughEvent.unlikeVideo({required int Id}) = _UnlikeVideo;
   
}
