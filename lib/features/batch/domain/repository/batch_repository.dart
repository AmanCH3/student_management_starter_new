import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchRepository {
  // parent class from repository child have to inherit
  //left -> failure
  // right -> void or other is success
  Future<Either<Failure , void>> createBatch(BatchEntity entity) ;
  Future<Either<Failure ,void>> deleteBatch(String id) ;
  Future<Either<Failure ,List<BatchEntity>>> getBatches() ;
}
