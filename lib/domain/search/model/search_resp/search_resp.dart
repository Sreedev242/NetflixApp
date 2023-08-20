import 'package:json_annotation/json_annotation.dart';



part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchResp({ this.results=const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}
@JsonSerializable()
class SearchResultData {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;
 
  @JsonKey(name: 'poster_path')
  String? posterPath;


  SearchResultData({
   
    this.id,
 
    this.title,

    this.posterPath,
 
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
