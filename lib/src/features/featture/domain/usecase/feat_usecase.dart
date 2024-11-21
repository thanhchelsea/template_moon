import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:template/src/features/featture/data/model.dart/image_upload_response/image_upload_response.dart';
import 'package:template/src/features/featture/domain/repository/advert_repository.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/base_model.dart';

class AdvertUsecase {
  AdvertUsecase(this._advertRepo);
  final FeatRepository _advertRepo;

  Future<BaseModel<ImageUploadData?>> uploadImage({required Uint8List images}) async {
    FormData formData = FormData.fromMap({
      "formFile": MultipartFile.fromBytes(
        images,
        filename: "filename",
      ),
    });

    var data = _advertRepo.uploadImage(checksum: md5.convert(images).toString(), formData: formData);
    return data;
  }
}
