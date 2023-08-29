import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/Hot&New%20resp/hot_and_new_resp/hot_and_new_resp.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}