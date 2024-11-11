import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feature_menu_model.freezed.dart';
part 'feature_menu_model.g.dart';

@freezed
class FeatureMenuModel with _$FeatureMenuModel {
  const factory FeatureMenuModel({
    @JsonKey(name: "featureId") int? featureId,
    @JsonKey(name: "featureName") String? featureName,
    @JsonKey(name: "route") String? route,
    @JsonKey(name: "iconUrl") String? iconUrl,
    @JsonKey(name: "parentFeatureId") int? parentFeatureId,
    @JsonKey(name: "children") List<FeatureMenuModel>? children,
    @JsonKey(name: "tabId") int? tabId,
    @JsonKey(name: "featureOrder") int? featureOrder,
  }) = _FeatureMenuModel;

  factory FeatureMenuModel.fromJson(Map<String, dynamic> json) => _$FeatureMenuModelFromJson(json);
}
