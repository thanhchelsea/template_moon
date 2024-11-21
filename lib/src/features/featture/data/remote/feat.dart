import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template/src/features/featture/data/model.dart/image_upload_response/image_upload_response.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/base_model.dart';

part 'feat.g.dart';

@RestApi()
abstract class FeatService {
  factory FeatService(Dio dio, {String? baseUrl}) = _FeatService;

  @POST('/files/image/upload')
  Future<BaseModel<ImageUploadData?>> uploadImage({
    @Query('checksum') required String checksum,
    @Body() required FormData formData,
  });
}
