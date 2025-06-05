import 'package:student_management/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseDataSource{
  Future<void> createCourse(CourseEntity entity) ;
  Future<void> deleteCourse(String id) ;
  Future<List<CourseEntity>> getCourses() ;
}