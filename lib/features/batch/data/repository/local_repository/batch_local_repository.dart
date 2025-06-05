import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

// child class
//One is LocalRepository

class BatchLocalRepository implements IBatchRepository {
  final BatchLocalRepository _batchLocalRepository; // object is called

  BatchLocalRepository({required BatchLocalRepository batchLocalRepository})
    : _batchLocalRepository = batchLocalRepository; // inside the variable
  @override
  Future<Either<Failure, void>> createBatch(BatchEntity entity) async {
    try {
      await _batchLocalRepository.createBatch(entity);
      return right(null); // right for the success
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      ); // left for the failure
    }
  }

  @override
  Future<Either<Failure, void>> deleteBatch(String id) async {
    try {
      return _batchLocalRepository.deleteBatch(id);
      return Right(null);
    } catch (e) {
      return left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatches() async {
    try {
      final batches = await _batchLocalRepository.getBatches();
      return Right(batches as List<BatchEntity>);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
