import 'package:student_management/features/auth/domain/entity/student_entity.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

abstract interface class IStudentDataSource {
  Future<void> createStudent(StudentEntity entity) ;
  Future<void> deleteStudent(String id) ;
  Future<List<StudentEntity>> getStudents() ;

}