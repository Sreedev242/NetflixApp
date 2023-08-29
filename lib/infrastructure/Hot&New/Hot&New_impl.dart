import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/core/api_end_points.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot&new_service.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot_and_new_resp/hot_and_new_resp.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';

class HotAndNewImplementation implements HotAndNewService { 
  
   @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData()async {
 
    final Response response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovieURL);
  try {
    if (response.statusCode==200 ||response.statusCode==201  ) {
      final result=HotAndNewResp.fromJson(response.data);
      return Right(result);
    }
    else{
      return Left(MainFailure.ServerFailure());
    }

  } catch (e) {
    print(e);
    return Left(MainFailure.ClientFailure());
  }
  
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async{
    final Response response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTvURL);
  try {
    if (response.statusCode==200 ||response.statusCode==201  ) {
      final result=HotAndNewResp.fromJson(response.data);
      return Right(result);
    }
    else{
      return Left(MainFailure.ServerFailure());
    }

  } catch (e) {
    print(e);
    return Left(MainFailure.ClientFailure());
  }
  
  }
  }

