part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initialize() = _Initialize;
    const factory SearchEvent.SearchMovie({required String movieQuery}) = _SearchMovie;
}