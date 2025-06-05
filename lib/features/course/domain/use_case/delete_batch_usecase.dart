import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';
import 'package:student_management/features/batch/domain/use_case/usecase.dart';

class DeleteBatchParams extends Equatable {
  final String batchId ;
  DeleteBatchParams ({
    required this.batchId
}) ;

  @override
  // TODO: implement props
  List<Object?> get props => [batchId] ;
}

class DeleteBatchUseCase implements UseCaseWithParams<void , DeleteBatchParams>{

  final IBatchRepository repository ;
  DeleteBatchUseCase (this.repository) ;
  @override
  Future<Either<Failure, void>> call(DeleteBatchParams params) async {

    return await  repository.deleteBatch(params.batchId) ;
  }

  
}