import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/auth/domain/entity/student_entity.dart';
import 'package:student_management/features/auth/domain/repository/student_repository.dart';

class StudentLocalRepository implements IStudentRepository {
  final StudentLocalRepository _studentLocalRepository ;
  StudentLocalRepository({
    required StudentLocalRepository studentLocalRepository
})  :_studentLocalRepository = studentLocalRepository ;
  @override
  Future<Either<Failure, void>> createStudent(StudentEntity entity) async{
    try {
      await _studentLocalRepository.createStudent(entity) ;
      return Right(null) ;


    }
    catch (e){
      return Left(
        LocalDatabaseFailure(message: e.toString())
      ) ;
    }
  }

  @override
  Future<Either<Failure, void>> deleteStudent(String id) async {
    try {
      await _studentLocalRepository.deleteStudent(id) ;
      return Right(null) ;

    }
    catch (e) {
      return left(
        LocalDatabaseFailure(message: e.toString())
      ) ;
    }

  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getStudents() async {
    try {
     final students = await _studentLocalRepository.getStudents() ;
     return Right(students as List<StudentEntity>) ;

    }
    catch(e){
      return Left(
        LocalDatabaseFailure(message: e.toString())
      );
    }
  }

}