// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureMenuModelImpl _$$FeatureMenuModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureMenuModelImpl(
      featureId: (json['featureId'] as num?)?.toInt(),
      featureName: json['featureName'] as String?,
      route: json['route'] as String?,
      iconUrl: json['iconUrl'] as String?,
      parentFeatureId: (json['parentFeatureId'] as num?)?.toInt(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => FeatureMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tabId: (json['tabId'] as num?)?.toInt(),
      featureOrder: (json['featureOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FeatureMenuModelImplToJson(
        _$FeatureMenuModelImpl instance) =>
    <String, dynamic>{
      'featureId': instance.featureId,
      'featureName': instance.featureName,
      'route': instance.route,
      'iconUrl': instance.iconUrl,
      'parentFeatureId': instance.parentFeatureId,
      'children': instance.children,
      'tabId': instance.tabId,
      'featureOrder': instance.featureOrder,
    };
