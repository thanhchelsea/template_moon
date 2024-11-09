// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseModel<T> _$BaseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseModel<T> {
  Page? get page => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseModelCopyWith<T, BaseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseModelCopyWith<T, $Res> {
  factory $BaseModelCopyWith(
          BaseModel<T> value, $Res Function(BaseModel<T>) then) =
      _$BaseModelCopyWithImpl<T, $Res, BaseModel<T>>;
  @useResult
  $Res call({Page? page, T? data});

  $PageCopyWith<$Res>? get page;
}

/// @nodoc
class _$BaseModelCopyWithImpl<T, $Res, $Val extends BaseModel<T>>
    implements $BaseModelCopyWith<T, $Res> {
  _$BaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $PageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseModelImplCopyWith<T, $Res>
    implements $BaseModelCopyWith<T, $Res> {
  factory _$$BaseModelImplCopyWith(
          _$BaseModelImpl<T> value, $Res Function(_$BaseModelImpl<T>) then) =
      __$$BaseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Page? page, T? data});

  @override
  $PageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$BaseModelImplCopyWithImpl<T, $Res>
    extends _$BaseModelCopyWithImpl<T, $Res, _$BaseModelImpl<T>>
    implements _$$BaseModelImplCopyWith<T, $Res> {
  __$$BaseModelImplCopyWithImpl(
      _$BaseModelImpl<T> _value, $Res Function(_$BaseModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BaseModelImpl<T>(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseModelImpl<T> implements _BaseModel<T> {
  const _$BaseModelImpl({this.page, this.data});

  factory _$BaseModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseModelImplFromJson(json, fromJsonT);

  @override
  final Page? page;
  @override
  final T? data;

  @override
  String toString() {
    return 'BaseModel<$T>(page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseModelImpl<T> &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseModelImplCopyWith<T, _$BaseModelImpl<T>> get copyWith =>
      __$$BaseModelImplCopyWithImpl<T, _$BaseModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseModel<T> implements BaseModel<T> {
  const factory _BaseModel({final Page? page, final T? data}) =
      _$BaseModelImpl<T>;

  factory _BaseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseModelImpl<T>.fromJson;

  @override
  Page? get page;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$BaseModelImplCopyWith<T, _$BaseModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
