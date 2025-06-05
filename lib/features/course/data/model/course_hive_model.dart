import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constant/hive_table_constant.dart';
part 'course_hive_model.g.dart';
@HiveType(typeId : HiveTableConstant.courseTableId)
class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? courseId ;

  @HiveField(1)
  final String courseName ;

  CourseHiveModel({
    String? courseId ,
    required this.courseName
})  : courseId  = courseId ?? Uuid().v4() ;  // auto generate the Unique id

  //Intial Constructor
    CourseHiveModel.intial()
        : courseId = "" , courseName = "" ;

  // From entity
  factory CourseHiveModel.fromEntity(CourseEntity entity){
      return CourseHiveModel(
        courseId: entity.courseId ,
        courseName: entity.courseName,
      ) ;
  }

  // TO entity
  CourseEntity toEntity(){
    return CourseEntity(
      courseId:  courseId ,
      courseName: courseName,

    ) ;
  }

  static List<CourseHiveModel> fromEntityList(List<CourseEntity> entityList){
    return entityList
        .map((entity) => CourseHiveModel.fromEntity(entity)).toList() ;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [courseId , courseName];

  //

}


// In flutter Id is not generate
// that's why we use Uuid().v4()
// 34-A -> 1212121-A => from the local
// from the mongoDb
// _id = 1211212 -> 34-A
