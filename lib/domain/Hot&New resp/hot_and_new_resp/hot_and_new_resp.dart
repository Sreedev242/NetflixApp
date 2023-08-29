import 'package:json_annotation/json_annotation.dart';



part 'hot_and_new_resp.g.dart';

@JsonSerializable()
class HotAndNewResp {

  @JsonKey(name:'page')
	int? page;
  
  @JsonKey(name:'results')
	List<HotAndNewData>? results;

	HotAndNewResp({this.page, this.results});

	factory HotAndNewResp.fromJson(Map<String, dynamic> json) {
		return _$HotAndNewRespFromJson(json);
	}

	Map<String, dynamic> toJson() => _$HotAndNewRespToJson(this);
}
@JsonSerializable()
class HotAndNewData{
	bool? adult;

	@JsonKey(name:'id')
	int? id;

	@JsonKey(name: 'original_title') 
	String? originalTitle;

  	@JsonKey(name: 'original_name') 
	String? originaltvName;

  @JsonKey(name:'overview')
	String? overview;
	
	@JsonKey(name: 'poster_path') 
	String? posterPath;

	@JsonKey(name: 'release_date') 
	String? releaseDate;



	HotAndNewData({
		this.adult, 
		
    
		this.id, 
		
    
		this.originalTitle, 
		this.overview, 
	
  
		this.posterPath, 
		this.releaseDate, 
	
  
	});

	factory HotAndNewData.fromJson(Map<String, dynamic> json) {
		return _$HotAndNewDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
