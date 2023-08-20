import 'package:freezed_annotation/freezed_annotation.dart';
part 'mainfailure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.ClientFailure() = _ClientFailure;
  const factory MainFailure.ServerFailure() = _ServerFailure;
}
