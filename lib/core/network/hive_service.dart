import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_management/app/constant/hive_table_constant.dart';
import 'package:student_management/features/auth/data/model/student_hive_model.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/course/data/model/course_hive_model.dart';

class HiveService {
  Future<void> int() async {
    //Initialize  the databasee
    var directory = await getApplicationDocumentsDirectory(); // from the path provide
    //since andriod and iphone have different path file
    var path = '${directory.path}/student_management_starter_new.db';

    Hive.init(path);

    //Register adapter
    // G file which is create using the build run build_runner build -d
    Hive.registerAdapter(BatchHiveModelAdapter());
    Hive.registerAdapter(CourseHiveModelAdapter()) ;
    Hive.registerAdapter(StudentHiveModelAdapter()) ;
  }

  //========================Batch queries=================================
  Future<void> addBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.put(batch.batchId, batch); // needed for search and delete
    await box.close() ;
  }

  Future<void> deleteBatch(String id) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.delete(id);
  }

  Future<List<BatchHiveModel>> getAllBatches() async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    return box.values.toList()
      ..sort((a, b) => a.batchName.compareTo(b.batchName),
      );
  }

  // =========================course queries =====================================
Future<void> addCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox) ;
    await box.put(course.courseId, course) ;
    await box.close() ;
}

Future<void> deleteCourse(String id) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox) ;
    await box.delete(id) ;
}

Future<List<CourseHiveModel>> getAllCourse() async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox) ;
    return box.values.toList()
      ..sort((a, b) => a.courseName.compareTo(b.courseName),
      );

}

 // ======================== student queries ======================
Future<void> addStudent(StudentHiveModel student) async {
    var box = await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox) ;
    await box.put(student.studentId, student) ;
    await box.close() ;
}

Future<void> deleteStudent(String id) async {
    var box = await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox) ;
    await box.delete(id) ;
}

Future<List<StudentHiveModel>> getAllStudents() async {
    var box = await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox) ;
    return box.values.toList()
    ..sort((a,b) => a.username.compareTo(b.username) ,) ;
}


}
