import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/search/model/search_resp/search_resp.dart';

abstract class SearchService{
Future<Either<MainFailure,SearchResp>> searchMovies({required String movieQuery});
}