import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/failures/mainfailure.dart';
import 'package:netflix_app/domain/downloads/model.dart';

abstract class iDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
