part of 'home_bloc_bloc.dart';

@freezed
class HomeBlocEvent with _$HomeBlocEvent {
  const factory HomeBlocEvent.started() = _Started;
}