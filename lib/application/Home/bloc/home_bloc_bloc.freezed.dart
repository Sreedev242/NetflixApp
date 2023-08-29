// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBlocEventCopyWith<$Res> {
  factory $HomeBlocEventCopyWith(
          HomeBlocEvent value, $Res Function(HomeBlocEvent) then) =
      _$HomeBlocEventCopyWithImpl<$Res, HomeBlocEvent>;
}

/// @nodoc
class _$HomeBlocEventCopyWithImpl<$Res, $Val extends HomeBlocEvent>
    implements $HomeBlocEventCopyWith<$Res> {
  _$HomeBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$HomeBlocEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'HomeBlocEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeBlocEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$HomeBlocState {
  List<Downloads> get TrendingList => throw _privateConstructorUsedError;
  List<HotAndNewData> get HomeMovieList => throw _privateConstructorUsedError;
  List<HotAndNewData> get HomeTvList => throw _privateConstructorUsedError;
  bool get idLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeBlocStateCopyWith<HomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBlocStateCopyWith<$Res> {
  factory $HomeBlocStateCopyWith(
          HomeBlocState value, $Res Function(HomeBlocState) then) =
      _$HomeBlocStateCopyWithImpl<$Res, HomeBlocState>;
  @useResult
  $Res call(
      {List<Downloads> TrendingList,
      List<HotAndNewData> HomeMovieList,
      List<HotAndNewData> HomeTvList,
      bool idLoading,
      bool isError});
}

/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res, $Val extends HomeBlocState>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TrendingList = null,
    Object? HomeMovieList = null,
    Object? HomeTvList = null,
    Object? idLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      TrendingList: null == TrendingList
          ? _value.TrendingList
          : TrendingList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      HomeMovieList: null == HomeMovieList
          ? _value.HomeMovieList
          : HomeMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      HomeTvList: null == HomeTvList
          ? _value.HomeTvList
          : HomeTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      idLoading: null == idLoading
          ? _value.idLoading
          : idLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $HomeBlocStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Downloads> TrendingList,
      List<HotAndNewData> HomeMovieList,
      List<HotAndNewData> HomeTvList,
      bool idLoading,
      bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TrendingList = null,
    Object? HomeMovieList = null,
    Object? HomeTvList = null,
    Object? idLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_Initial(
      TrendingList: null == TrendingList
          ? _value._TrendingList
          : TrendingList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      HomeMovieList: null == HomeMovieList
          ? _value._HomeMovieList
          : HomeMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      HomeTvList: null == HomeTvList
          ? _value._HomeTvList
          : HomeTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      idLoading: null == idLoading
          ? _value.idLoading
          : idLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<Downloads> TrendingList,
      required final List<HotAndNewData> HomeMovieList,
      required final List<HotAndNewData> HomeTvList,
      required this.idLoading,
      required this.isError})
      : _TrendingList = TrendingList,
        _HomeMovieList = HomeMovieList,
        _HomeTvList = HomeTvList;

  final List<Downloads> _TrendingList;
  @override
  List<Downloads> get TrendingList {
    if (_TrendingList is EqualUnmodifiableListView) return _TrendingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_TrendingList);
  }

  final List<HotAndNewData> _HomeMovieList;
  @override
  List<HotAndNewData> get HomeMovieList {
    if (_HomeMovieList is EqualUnmodifiableListView) return _HomeMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_HomeMovieList);
  }

  final List<HotAndNewData> _HomeTvList;
  @override
  List<HotAndNewData> get HomeTvList {
    if (_HomeTvList is EqualUnmodifiableListView) return _HomeTvList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_HomeTvList);
  }

  @override
  final bool idLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeBlocState(TrendingList: $TrendingList, HomeMovieList: $HomeMovieList, HomeTvList: $HomeTvList, idLoading: $idLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._TrendingList, _TrendingList) &&
            const DeepCollectionEquality()
                .equals(other._HomeMovieList, _HomeMovieList) &&
            const DeepCollectionEquality()
                .equals(other._HomeTvList, _HomeTvList) &&
            (identical(other.idLoading, idLoading) ||
                other.idLoading == idLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_TrendingList),
      const DeepCollectionEquality().hash(_HomeMovieList),
      const DeepCollectionEquality().hash(_HomeTvList),
      idLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeBlocState {
  const factory _Initial(
      {required final List<Downloads> TrendingList,
      required final List<HotAndNewData> HomeMovieList,
      required final List<HotAndNewData> HomeTvList,
      required final bool idLoading,
      required final bool isError}) = _$_Initial;

  @override
  List<Downloads> get TrendingList;
  @override
  List<HotAndNewData> get HomeMovieList;
  @override
  List<HotAndNewData> get HomeTvList;
  @override
  bool get idLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
