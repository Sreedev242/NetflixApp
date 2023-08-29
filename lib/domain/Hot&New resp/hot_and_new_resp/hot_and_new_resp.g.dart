// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_and_new_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotAndNewResp _$HotAndNewRespFromJson(Map<String, dynamic> json) =>
    HotAndNewResp(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => HotAndNewData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotAndNewRespToJson(HotAndNewResp instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

HotAndNewData _$HotAndNewDataFromJson(Map<String, dynamic> json) =>
    HotAndNewData(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
    )..originaltvName = json['original_name'] as String?;

Map<String, dynamic> _$HotAndNewDataToJson(HotAndNewData instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_name': instance.originaltvName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
    };
