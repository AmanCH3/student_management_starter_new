import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constant/hive_table_constant.dart';

part 'batch_hive_model.g.dart';
@HiveType(typeId : HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String? batchId ;
  @HiveField(1)
  final String batchName ;



  BatchHiveModel ({
    String? batchId ,
    required this.batchName ,

}) : batchId = batchId ?? const Uuid().v4() ; // id is generated auto

  // inital contrunctor
  // batch id is set empty
  // batchName is set empty

  const BatchHiveModel.initial() : batchId = "" , batchName = "" ;


  // from Entity
  // To change the send the entity the required
  // Model convert them in to desired format
  // Json to dart

  //for example full name in the api fbut in the UI part let say
  // firstName and lastName is there

factory BatchHiveModel.fromEntity(BatchEntity entity) {
  return BatchHiveModel(
      batchId: entity.batchId,
      batchName: entity.batchName) ;
}

BatchEntity toEntity(){
  return BatchEntity(
    batchId: batchId ,
    batchName: batchName ,
  ) ;
}

//To Entity List
  // Get all feature
  // ToEnity
  // To change the dart to json

  static List<BatchHiveModel> fromEntityList(List<BatchEntity> entityList){
  return entityList
      .map((entity) => BatchHiveModel.fromEntity(entity)).toList() ;
  }




  @override
  // TODO: implement props
  List<Object?> get props => [batchId , batchName] ;
}