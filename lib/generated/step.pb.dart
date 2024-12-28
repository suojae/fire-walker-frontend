//
//  Generated code. Do not modify.
//  source: step.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StepInput extends $pb.GeneratedMessage {
  factory StepInput({
    $core.String? userId,
    $core.int? steps,
    $core.String? date,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (steps != null) {
      $result.steps = steps;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  StepInput._() : super();
  factory StepInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StepInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StepInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'step'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'steps', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'date')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StepInput clone() => StepInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StepInput copyWith(void Function(StepInput) updates) => super.copyWith((message) => updates(message as StepInput)) as StepInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StepInput create() => StepInput._();
  StepInput createEmptyInstance() => create();
  static $pb.PbList<StepInput> createRepeated() => $pb.PbList<StepInput>();
  @$core.pragma('dart2js:noInline')
  static StepInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StepInput>(create);
  static StepInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get steps => $_getIZ(1);
  @$pb.TagNumber(2)
  set steps($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSteps() => $_has(1);
  @$pb.TagNumber(2)
  void clearSteps() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
}

class StepResponse extends $pb.GeneratedMessage {
  factory StepResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  StepResponse._() : super();
  factory StepResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StepResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StepResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'step'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StepResponse clone() => StepResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StepResponse copyWith(void Function(StepResponse) updates) => super.copyWith((message) => updates(message as StepResponse)) as StepResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StepResponse create() => StepResponse._();
  StepResponse createEmptyInstance() => create();
  static $pb.PbList<StepResponse> createRepeated() => $pb.PbList<StepResponse>();
  @$core.pragma('dart2js:noInline')
  static StepResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StepResponse>(create);
  static StepResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetStepsInput extends $pb.GeneratedMessage {
  factory GetStepsInput({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetStepsInput._() : super();
  factory GetStepsInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStepsInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStepsInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'step'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStepsInput clone() => GetStepsInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStepsInput copyWith(void Function(GetStepsInput) updates) => super.copyWith((message) => updates(message as GetStepsInput)) as GetStepsInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStepsInput create() => GetStepsInput._();
  GetStepsInput createEmptyInstance() => create();
  static $pb.PbList<GetStepsInput> createRepeated() => $pb.PbList<GetStepsInput>();
  @$core.pragma('dart2js:noInline')
  static GetStepsInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStepsInput>(create);
  static GetStepsInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class StepsResponse extends $pb.GeneratedMessage {
  factory StepsResponse({
    $core.Iterable<StepRecord>? records,
  }) {
    final $result = create();
    if (records != null) {
      $result.records.addAll(records);
    }
    return $result;
  }
  StepsResponse._() : super();
  factory StepsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StepsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StepsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'step'), createEmptyInstance: create)
    ..pc<StepRecord>(1, _omitFieldNames ? '' : 'records', $pb.PbFieldType.PM, subBuilder: StepRecord.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StepsResponse clone() => StepsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StepsResponse copyWith(void Function(StepsResponse) updates) => super.copyWith((message) => updates(message as StepsResponse)) as StepsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StepsResponse create() => StepsResponse._();
  StepsResponse createEmptyInstance() => create();
  static $pb.PbList<StepsResponse> createRepeated() => $pb.PbList<StepsResponse>();
  @$core.pragma('dart2js:noInline')
  static StepsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StepsResponse>(create);
  static StepsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StepRecord> get records => $_getList(0);
}

class StepRecord extends $pb.GeneratedMessage {
  factory StepRecord({
    $core.String? date,
    $core.int? steps,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (steps != null) {
      $result.steps = steps;
    }
    return $result;
  }
  StepRecord._() : super();
  factory StepRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StepRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StepRecord', package: const $pb.PackageName(_omitMessageNames ? '' : 'step'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'date')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'steps', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StepRecord clone() => StepRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StepRecord copyWith(void Function(StepRecord) updates) => super.copyWith((message) => updates(message as StepRecord)) as StepRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StepRecord create() => StepRecord._();
  StepRecord createEmptyInstance() => create();
  static $pb.PbList<StepRecord> createRepeated() => $pb.PbList<StepRecord>();
  @$core.pragma('dart2js:noInline')
  static StepRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StepRecord>(create);
  static StepRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get date => $_getSZ(0);
  @$pb.TagNumber(1)
  set date($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get steps => $_getIZ(1);
  @$pb.TagNumber(2)
  set steps($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSteps() => $_has(1);
  @$pb.TagNumber(2)
  void clearSteps() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
