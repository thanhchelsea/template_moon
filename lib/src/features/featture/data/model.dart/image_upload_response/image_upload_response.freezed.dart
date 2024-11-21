// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageUploadData _$ImageUploadDataFromJson(Map<String, dynamic> json) {
  return _ImageUploadData.fromJson(json);
}

/// @nodoc
mixin _$ImageUploadData {
  @JsonKey(name: "fileName")
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: "filePath")
  String get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: "sizeInKB")
  int get sizeInKb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageUploadDataCopyWith<ImageUploadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadDataCopyWith<$Res> {
  factory $ImageUploadDataCopyWith(
          ImageUploadData value, $Res Function(ImageUploadData) then) =
      _$ImageUploadDataCopyWithImpl<$Res, ImageUploadData>;
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "filePath") String filePath,
      @JsonKey(name: "width") int width,
      @JsonKey(name: "height") int height,
      @JsonKey(name: "sizeInKB") int sizeInKb});
}

/// @nodoc
class _$ImageUploadDataCopyWithImpl<$Res, $Val extends ImageUploadData>
    implements $ImageUploadDataCopyWith<$Res> {
  _$ImageUploadDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
    Object? width = null,
    Object? height = null,
    Object? sizeInKb = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      sizeInKb: null == sizeInKb
          ? _value.sizeInKb
          : sizeInKb // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageUploadDataImplCopyWith<$Res>
    implements $ImageUploadDataCopyWith<$Res> {
  factory _$$ImageUploadDataImplCopyWith(_$ImageUploadDataImpl value,
          $Res Function(_$ImageUploadDataImpl) then) =
      __$$ImageUploadDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "filePath") String filePath,
      @JsonKey(name: "width") int width,
      @JsonKey(name: "height") int height,
      @JsonKey(name: "sizeInKB") int sizeInKb});
}

/// @nodoc
class __$$ImageUploadDataImplCopyWithImpl<$Res>
    extends _$ImageUploadDataCopyWithImpl<$Res, _$ImageUploadDataImpl>
    implements _$$ImageUploadDataImplCopyWith<$Res> {
  __$$ImageUploadDataImplCopyWithImpl(
      _$ImageUploadDataImpl _value, $Res Function(_$ImageUploadDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
    Object? width = null,
    Object? height = null,
    Object? sizeInKb = null,
  }) {
    return _then(_$ImageUploadDataImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      sizeInKb: null == sizeInKb
          ? _value.sizeInKb
          : sizeInKb // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageUploadDataImpl implements _ImageUploadData {
  const _$ImageUploadDataImpl(
      {@JsonKey(name: "fileName") this.fileName = "",
      @JsonKey(name: "filePath") this.filePath = "",
      @JsonKey(name: "width") this.width = 0,
      @JsonKey(name: "height") this.height = 0,
      @JsonKey(name: "sizeInKB") this.sizeInKb = 0});

  factory _$ImageUploadDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageUploadDataImplFromJson(json);

  @override
  @JsonKey(name: "fileName")
  final String fileName;
  @override
  @JsonKey(name: "filePath")
  final String filePath;
  @override
  @JsonKey(name: "width")
  final int width;
  @override
  @JsonKey(name: "height")
  final int height;
  @override
  @JsonKey(name: "sizeInKB")
  final int sizeInKb;

  @override
  String toString() {
    return 'ImageUploadData(fileName: $fileName, filePath: $filePath, width: $width, height: $height, sizeInKb: $sizeInKb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUploadDataImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.sizeInKb, sizeInKb) ||
                other.sizeInKb == sizeInKb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fileName, filePath, width, height, sizeInKb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUploadDataImplCopyWith<_$ImageUploadDataImpl> get copyWith =>
      __$$ImageUploadDataImplCopyWithImpl<_$ImageUploadDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageUploadDataImplToJson(
      this,
    );
  }
}

abstract class _ImageUploadData implements ImageUploadData {
  const factory _ImageUploadData(
      {@JsonKey(name: "fileName") final String fileName,
      @JsonKey(name: "filePath") final String filePath,
      @JsonKey(name: "width") final int width,
      @JsonKey(name: "height") final int height,
      @JsonKey(name: "sizeInKB") final int sizeInKb}) = _$ImageUploadDataImpl;

  factory _ImageUploadData.fromJson(Map<String, dynamic> json) =
      _$ImageUploadDataImpl.fromJson;

  @override
  @JsonKey(name: "fileName")
  String get fileName;
  @override
  @JsonKey(name: "filePath")
  String get filePath;
  @override
  @JsonKey(name: "width")
  int get width;
  @override
  @JsonKey(name: "height")
  int get height;
  @override
  @JsonKey(name: "sizeInKB")
  int get sizeInKb;
  @override
  @JsonKey(ignore: true)
  _$$ImageUploadDataImplCopyWith<_$ImageUploadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
