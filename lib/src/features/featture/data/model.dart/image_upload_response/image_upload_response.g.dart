// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageUploadDataImpl _$$ImageUploadDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageUploadDataImpl(
      fileName: json['fileName'] as String? ?? "",
      filePath: json['filePath'] as String? ?? "",
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      sizeInKb: (json['sizeInKB'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ImageUploadDataImplToJson(
        _$ImageUploadDataImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'width': instance.width,
      'height': instance.height,
      'sizeInKB': instance.sizeInKb,
    };
