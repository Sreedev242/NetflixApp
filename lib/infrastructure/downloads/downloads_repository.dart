import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/api_end_points.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/model.dart';

class DownloadsRepo implements iDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    // TODO: implement getDownloadsImage

    final Response response = await Dio(BaseOptions()).get(ApiEndPoints.x);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        

        // log(responseList.toString());

        final List<Downloads> downloadsList = (response.data['results'] as List)
            .map((e) => Downloads.fromJson(e))
            .toList();
    // print(downloadsList);
        return Right(downloadsList);
      } else {
        return Left(MainFailure.ClientFailure());
      }
    } catch (e) {
      // print(e);
      return Left(MainFailure.ServerFailure());
    }
  }
}
