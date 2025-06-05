import 'package:dartz/dartz.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class ICourseRepository {

  Future<Either<Failure , void>> createCourse(CourseEntity enity) ;
  Future<Either<Failure , void>> deleteCourse(String id) ;
  Future<Either<Failure, List<CourseEntity>>> getCourses() ;
}