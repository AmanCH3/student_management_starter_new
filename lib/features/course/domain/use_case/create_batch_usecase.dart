import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';
import '../../../batch/domain/use_case/usecase.dart';
import 'create_batch_usecase.dart' ;
class CreateBatchParams extends Equatable {
  final String batchName  ;
  const CreateBatchParams({
    required this.batchName
}) ;
  @override
  // TODO: implement props
  List<Object?> get props => [batchName];

}

class CreateBatchUseCase implements UseCaseWithParams<void , CreateBatchParams>{
  //check internet connection
  final IBatchRepository repository ;
  CreateBatchUseCase(this.repository) ;
  @override
  Future<Either<Failure, void>> call(CreateBatchParams params) {
    // TODO: implement call
    var batchEntity = BatchEntity(batchName: params.batchName) ;
    return repository.createBatch(batchEntity) ;

  }




}