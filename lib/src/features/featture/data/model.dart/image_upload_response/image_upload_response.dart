import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_upload_response.freezed.dart';
part 'image_upload_response.g.dart';

@freezed
class ImageUploadData with _$ImageUploadData {
  const factory ImageUploadData({
    @JsonKey(name: "fileName") @Default("") String fileName,
    @JsonKey(name: "filePath") @Default("") String filePath,
    @JsonKey(name: "width") @Default(0) int width,
    @JsonKey(name: "height") @Default(0) int height,
    @JsonKey(name: "sizeInKB") @Default(0) int sizeInKb,
  }) = _ImageUploadData;

  factory ImageUploadData.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadDataFromJson(json);
}
