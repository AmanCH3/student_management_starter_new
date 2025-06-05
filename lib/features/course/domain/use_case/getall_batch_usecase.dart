import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';
import 'package:student_management/features/batch/domain/use_case/usecase.dart';

class GetAllBatchesUseCase implements UseCaseWithOutParams<List<BatchEntity>>{
  final IBatchRepository repository ;
  GetAllBatchesUseCase({

    required this.repository ,
  }) ;
  @override
  Future<Either<Failure, List<BatchEntity>>> call() async {
    return await repository.getBatches() ;

  }

}