import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/batch/data/data_source/batch_data_source.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDataSource implements IBatchDataSource {
  final HiveService _hiveService ;

  BatchLocalDataSource({
    required HiveService hiveService
}) : _hiveService = hiveService ;

  @override
  Future<void> createBatch(BatchEntity entity) async {
    try {
      final batchHiveModel = BatchHiveModel.fromEntity(entity) ;
      await _hiveService.addBatch(batchHiveModel) ;


    }
    catch(e){
      throw Exception(e) ;
    }
  }

  @override
  Future<void> deleteBatch(String id) async{
    try {
      return _hiveService.deleteBatch(id) ;

    }
    catch (e){
      throw Exception(e) ;
    }
  }

  @override
  Future<List<BatchEntity>> getBatches() async {
    try {
      return _hiveService.getAllBatches().then((value){
        return value.map((e) => e.toEntity()).toList() ;
      }) ;

    }
    catch(e){
      throw Exception(e) ;
    }

  }
}