import 'package:equatable/equatable.dart';

class BatchEntity extends Equatable {
  final String? batchId ; // can be nullable while creating we need id but while send the batch name we don't send id that's why
  final String batchName ;

  const BatchEntity ({
    this.batchId ,
    required this.batchName ,
}) ;
  @override
  List<Object?> get props => [batchId , batchName];
}