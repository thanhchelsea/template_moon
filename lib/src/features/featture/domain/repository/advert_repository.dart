import 'package:dio/dio.dart';
import 'package:template/src/features/featture/data/model.dart/image_upload_response/image_upload_response.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/base_model.dart';

abstract class FeatRepository {
  Future<BaseModel<ImageUploadData?>> uploadImage({
    required String checksum,
    required FormData formData,
  });
}
