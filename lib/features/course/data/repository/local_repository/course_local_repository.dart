import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:student_management/features/course/domain/repository/course_repository.dart';

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalRepository _courseLocalRepository ;

  CourseLocalRepository({
    required CourseLocalRepository courseLocalRepository
}) : _courseLocalRepository = courseLocalRepository ;

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity enity)  async{
    try {
      await _courseLocalRepository.createCourse(enity) ;
      return right(null) ;

    }
    catch (e){
      // throw Exception(e)
      return Left(

      LocalDatabaseFailure(message:  e.toString())
      ) ;
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) async{
   try {
     return _courseLocalRepository.deleteCourse(id) ;
     return Right(null) ;

   }
   catch(e){
     return left(

     LocalDatabaseFailure(message: e.toString())
     ) ;
   }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async{
    try {
      final courses = await _courseLocalRepository.getCourses() ;
      return Right(courses as List<CourseEntity>) ;


    }
    catch (e){
      return left(
        LocalDatabaseFailure(message: e.toString())

      ) ;

    }
  }

}