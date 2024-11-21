import 'package:dio/dio.dart';
import 'package:template/src/features/featture/data/model.dart/image_upload_response/image_upload_response.dart';
import 'package:template/src/features/featture/data/remote/feat.dart';
import 'package:template/src/features/featture/domain/repository/advert_repository.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/base_model.dart';

class FeatRepoImpl extends FeatRepository {
  FeatRepoImpl(this._featService);
  FeatService _featService;

  @override
  Future<BaseModel<ImageUploadData?>> uploadImage({
    required String checksum,
    required FormData formData,
  }) {
    return _featService.uploadImage(checksum: checksum, formData: formData);
  }
}
