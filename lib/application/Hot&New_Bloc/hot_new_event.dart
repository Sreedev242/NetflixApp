part of 'hot_new_bloc.dart';

@freezed
class HotAndNewEvent with _$HotAndNewEvent {
  const factory HotAndNewEvent.LoadDataInComingsoon() = _LoadDataInComingsoon;
  const factory HotAndNewEvent.LoadDataInEveryonesWatching() = _LoadDataInEveryonesWatching;
}