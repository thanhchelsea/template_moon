import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/page.dart';

part 'base_model.freezed.dart';
part 'base_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseModel<T> with _$BaseModel<T> {
  const factory BaseModel({
    final Page? page,
    final T? data,
  }) = _BaseModel;

  factory BaseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseModelFromJson<T>(json, fromJsonT);
}
