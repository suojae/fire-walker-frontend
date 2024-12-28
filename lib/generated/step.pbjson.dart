//
//  Generated code. Do not modify.
//  source: step.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stepInputDescriptor instead')
const StepInput$json = {
  '1': 'StepInput',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'steps', '3': 2, '4': 1, '5': 5, '10': 'steps'},
    {'1': 'date', '3': 3, '4': 1, '5': 9, '10': 'date'},
  ],
};

/// Descriptor for `StepInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stepInputDescriptor = $convert.base64Decode(
    'CglTdGVwSW5wdXQSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFAoFc3RlcHMYAiABKAVSBXN0ZX'
    'BzEhIKBGRhdGUYAyABKAlSBGRhdGU=');

@$core.Deprecated('Use stepResponseDescriptor instead')
const StepResponse$json = {
  '1': 'StepResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `StepResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stepResponseDescriptor = $convert.base64Decode(
    'CgxTdGVwUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getStepsInputDescriptor instead')
const GetStepsInput$json = {
  '1': 'GetStepsInput',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetStepsInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStepsInputDescriptor = $convert.base64Decode(
    'Cg1HZXRTdGVwc0lucHV0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use stepsResponseDescriptor instead')
const StepsResponse$json = {
  '1': 'StepsResponse',
  '2': [
    {'1': 'records', '3': 1, '4': 3, '5': 11, '6': '.step.StepRecord', '10': 'records'},
  ],
};

/// Descriptor for `StepsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stepsResponseDescriptor = $convert.base64Decode(
    'Cg1TdGVwc1Jlc3BvbnNlEioKB3JlY29yZHMYASADKAsyEC5zdGVwLlN0ZXBSZWNvcmRSB3JlY2'
    '9yZHM=');

@$core.Deprecated('Use stepRecordDescriptor instead')
const StepRecord$json = {
  '1': 'StepRecord',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 9, '10': 'date'},
    {'1': 'steps', '3': 2, '4': 1, '5': 5, '10': 'steps'},
  ],
};

/// Descriptor for `StepRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stepRecordDescriptor = $convert.base64Decode(
    'CgpTdGVwUmVjb3JkEhIKBGRhdGUYASABKAlSBGRhdGUSFAoFc3RlcHMYAiABKAVSBXN0ZXBz');

