import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/auth/data/data_source/student_data_source.dart';
import 'package:student_management/features/auth/data/model/student_hive_model.dart';
import 'package:student_management/features/auth/domain/entity/student_entity.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class StudentLocalDataSource implements IStudentDataSource {
  final HiveService _hiveService ;

  StudentLocalDataSource({
    required HiveService hiveService
}) : _hiveService = hiveService ;
  @override
  Future<void> createStudent(StudentEntity entity) async {
    try {
      final studentHiveModel =  StudentHiveModel.fromEntity(entity) ;
      await _hiveService.addStudent(studentHiveModel) ;

    }
    catch(e){
      throw Exception(e) ;
    }
  }

  @override
  Future<void> deleteStudent(String id) async{
    try {
      await _hiveService.deleteCourse(id) ;
    }
    catch (e){
      throw Exception(e) ;
    }
  }

  @override
  Future<List<StudentEntity>> getStudents() async {
    try {

      return _hiveService.getAllStudents().then((value){
        return value.map((e) => e.toEntity()).toList() ;
      }) ;
    }
    catch(e){
      throw Exception(e) ;
    }

  }

}