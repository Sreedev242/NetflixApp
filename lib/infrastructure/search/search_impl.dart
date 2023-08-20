import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/search_service.dart';
import 'package:netflix_app/domain/search/model/search_resp/search_resp.dart';

import '../../core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    
    try {final Response response = await Dio(BaseOptions()).get(
      ApiEndPoints.searchPageUrl,
      queryParameters: {'query': movieQuery},
    );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        // log(responseList.toString());
    //  print(result);
        return Right(result);
      } else {
        return Left(MainFailure.ClientFailure());
      }
    } catch (e) {
      print(e);
      return Left(MainFailure.ServerFailure());
    }
  }
}
