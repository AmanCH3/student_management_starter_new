import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? courseId ;
  final String courseName ;

  CourseEntity ({
    this.courseId ,
    required this.courseName ,
}) ;
  @override
  // TODO: implement props
  List<Object?> get props => [courseId , courseName];

}