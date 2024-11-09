// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureMenuModel _$FeatureMenuModelFromJson(Map<String, dynamic> json) {
  return _FeatureMenuModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureMenuModel {
  @JsonKey(name: "featureId")
  int? get featureId => throw _privateConstructorUsedError;
  @JsonKey(name: "featureName")
  String? get featureName => throw _privateConstructorUsedError;
  @JsonKey(name: "route")
  String? get route => throw _privateConstructorUsedError;
  @JsonKey(name: "iconUrl")
  String? get iconUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "parentFeatureId")
  int? get parentFeatureId => throw _privateConstructorUsedError;
  @JsonKey(name: "children")
  List<FeatureMenuModel>? get children => throw _privateConstructorUsedError;
  @JsonKey(name: "tabId")
  int? get tabId => throw _privateConstructorUsedError;
  @JsonKey(name: "featureOrder")
  int? get featureOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureMenuModelCopyWith<FeatureMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureMenuModelCopyWith<$Res> {
  factory $FeatureMenuModelCopyWith(
          FeatureMenuModel value, $Res Function(FeatureMenuModel) then) =
      _$FeatureMenuModelCopyWithImpl<$Res, FeatureMenuModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "featureId") int? featureId,
      @JsonKey(name: "featureName") String? featureName,
      @JsonKey(name: "route") String? route,
      @JsonKey(name: "iconUrl") String? iconUrl,
      @JsonKey(name: "parentFeatureId") int? parentFeatureId,
      @JsonKey(name: "children") List<FeatureMenuModel>? children,
      @JsonKey(name: "tabId") int? tabId,
      @JsonKey(name: "featureOrder") int? featureOrder});
}

/// @nodoc
class _$FeatureMenuModelCopyWithImpl<$Res, $Val extends FeatureMenuModel>
    implements $FeatureMenuModelCopyWith<$Res> {
  _$FeatureMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureId = freezed,
    Object? featureName = freezed,
    Object? route = freezed,
    Object? iconUrl = freezed,
    Object? parentFeatureId = freezed,
    Object? children = freezed,
    Object? tabId = freezed,
    Object? featureOrder = freezed,
  }) {
    return _then(_value.copyWith(
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as int?,
      featureName: freezed == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      parentFeatureId: freezed == parentFeatureId
          ? _value.parentFeatureId
          : parentFeatureId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FeatureMenuModel>?,
      tabId: freezed == tabId
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int?,
      featureOrder: freezed == featureOrder
          ? _value.featureOrder
          : featureOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureMenuModelImplCopyWith<$Res>
    implements $FeatureMenuModelCopyWith<$Res> {
  factory _$$FeatureMenuModelImplCopyWith(_$FeatureMenuModelImpl value,
          $Res Function(_$FeatureMenuModelImpl) then) =
      __$$FeatureMenuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "featureId") int? featureId,
      @JsonKey(name: "featureName") String? featureName,
      @JsonKey(name: "route") String? route,
      @JsonKey(name: "iconUrl") String? iconUrl,
      @JsonKey(name: "parentFeatureId") int? parentFeatureId,
      @JsonKey(name: "children") List<FeatureMenuModel>? children,
      @JsonKey(name: "tabId") int? tabId,
      @JsonKey(name: "featureOrder") int? featureOrder});
}

/// @nodoc
class __$$FeatureMenuModelImplCopyWithImpl<$Res>
    extends _$FeatureMenuModelCopyWithImpl<$Res, _$FeatureMenuModelImpl>
    implements _$$FeatureMenuModelImplCopyWith<$Res> {
  __$$FeatureMenuModelImplCopyWithImpl(_$FeatureMenuModelImpl _value,
      $Res Function(_$FeatureMenuModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureId = freezed,
    Object? featureName = freezed,
    Object? route = freezed,
    Object? iconUrl = freezed,
    Object? parentFeatureId = freezed,
    Object? children = freezed,
    Object? tabId = freezed,
    Object? featureOrder = freezed,
  }) {
    return _then(_$FeatureMenuModelImpl(
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as int?,
      featureName: freezed == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      parentFeatureId: freezed == parentFeatureId
          ? _value.parentFeatureId
          : parentFeatureId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FeatureMenuModel>?,
      tabId: freezed == tabId
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int?,
      featureOrder: freezed == featureOrder
          ? _value.featureOrder
          : featureOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureMenuModelImpl implements _FeatureMenuModel {
  const _$FeatureMenuModelImpl(
      {@JsonKey(name: "featureId") this.featureId,
      @JsonKey(name: "featureName") this.featureName,
      @JsonKey(name: "route") this.route,
      @JsonKey(name: "iconUrl") this.iconUrl,
      @JsonKey(name: "parentFeatureId") this.parentFeatureId,
      @JsonKey(name: "children") final List<FeatureMenuModel>? children,
      @JsonKey(name: "tabId") this.tabId,
      @JsonKey(name: "featureOrder") this.featureOrder})
      : _children = children;

  factory _$FeatureMenuModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureMenuModelImplFromJson(json);

  @override
  @JsonKey(name: "featureId")
  final int? featureId;
  @override
  @JsonKey(name: "featureName")
  final String? featureName;
  @override
  @JsonKey(name: "route")
  final String? route;
  @override
  @JsonKey(name: "iconUrl")
  final String? iconUrl;
  @override
  @JsonKey(name: "parentFeatureId")
  final int? parentFeatureId;
  final List<FeatureMenuModel>? _children;
  @override
  @JsonKey(name: "children")
  List<FeatureMenuModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "tabId")
  final int? tabId;
  @override
  @JsonKey(name: "featureOrder")
  final int? featureOrder;

  @override
  String toString() {
    return 'FeatureMenuModel(featureId: $featureId, featureName: $featureName, route: $route, iconUrl: $iconUrl, parentFeatureId: $parentFeatureId, children: $children, tabId: $tabId, featureOrder: $featureOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureMenuModelImpl &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.parentFeatureId, parentFeatureId) ||
                other.parentFeatureId == parentFeatureId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.tabId, tabId) || other.tabId == tabId) &&
            (identical(other.featureOrder, featureOrder) ||
                other.featureOrder == featureOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      featureId,
      featureName,
      route,
      iconUrl,
      parentFeatureId,
      const DeepCollectionEquality().hash(_children),
      tabId,
      featureOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureMenuModelImplCopyWith<_$FeatureMenuModelImpl> get copyWith =>
      __$$FeatureMenuModelImplCopyWithImpl<_$FeatureMenuModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureMenuModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureMenuModel implements FeatureMenuModel {
  const factory _FeatureMenuModel(
          {@JsonKey(name: "featureId") final int? featureId,
          @JsonKey(name: "featureName") final String? featureName,
          @JsonKey(name: "route") final String? route,
          @JsonKey(name: "iconUrl") final String? iconUrl,
          @JsonKey(name: "parentFeatureId") final int? parentFeatureId,
          @JsonKey(name: "children") final List<FeatureMenuModel>? children,
          @JsonKey(name: "tabId") final int? tabId,
          @JsonKey(name: "featureOrder") final int? featureOrder}) =
      _$FeatureMenuModelImpl;

  factory _FeatureMenuModel.fromJson(Map<String, dynamic> json) =
      _$FeatureMenuModelImpl.fromJson;

  @override
  @JsonKey(name: "featureId")
  int? get featureId;
  @override
  @JsonKey(name: "featureName")
  String? get featureName;
  @override
  @JsonKey(name: "route")
  String? get route;
  @override
  @JsonKey(name: "iconUrl")
  String? get iconUrl;
  @override
  @JsonKey(name: "parentFeatureId")
  int? get parentFeatureId;
  @override
  @JsonKey(name: "children")
  List<FeatureMenuModel>? get children;
  @override
  @JsonKey(name: "tabId")
  int? get tabId;
  @override
  @JsonKey(name: "featureOrder")
  int? get featureOrder;
  @override
  @JsonKey(ignore: true)
  _$$FeatureMenuModelImplCopyWith<_$FeatureMenuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
