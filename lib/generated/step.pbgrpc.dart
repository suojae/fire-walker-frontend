//
//  Generated code. Do not modify.
//  source: step.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'step.pb.dart' as $0;

export 'step.pb.dart';

@$pb.GrpcServiceName('step.StepService')
class StepServiceClient extends $grpc.Client {
  static final _$recordSteps = $grpc.ClientMethod<$0.StepInput, $0.StepResponse>(
      '/step.StepService/RecordSteps',
      ($0.StepInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StepResponse.fromBuffer(value));
  static final _$getStepsByUser = $grpc.ClientMethod<$0.GetStepsInput, $0.StepsResponse>(
      '/step.StepService/GetStepsByUser',
      ($0.GetStepsInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StepsResponse.fromBuffer(value));
  static final _$streamSteps = $grpc.ClientMethod<$0.GetStepsInput, $0.StepRecord>(
      '/step.StepService/StreamSteps',
      ($0.GetStepsInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StepRecord.fromBuffer(value));
  static final _$streamUserSteps = $grpc.ClientMethod<$0.StepInput, $0.StepResponse>(
      '/step.StepService/StreamUserSteps',
      ($0.StepInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StepResponse.fromBuffer(value));

  StepServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.StepResponse> recordSteps($0.StepInput request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordSteps, request, options: options);
  }

  $grpc.ResponseFuture<$0.StepsResponse> getStepsByUser($0.GetStepsInput request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStepsByUser, request, options: options);
  }

  $grpc.ResponseStream<$0.StepRecord> streamSteps($0.GetStepsInput request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamSteps, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.StepResponse> streamUserSteps($async.Stream<$0.StepInput> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamUserSteps, request, options: options);
  }
}

@$pb.GrpcServiceName('step.StepService')
abstract class StepServiceBase extends $grpc.Service {
  $core.String get $name => 'step.StepService';

  StepServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StepInput, $0.StepResponse>(
        'RecordSteps',
        recordSteps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StepInput.fromBuffer(value),
        ($0.StepResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStepsInput, $0.StepsResponse>(
        'GetStepsByUser',
        getStepsByUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStepsInput.fromBuffer(value),
        ($0.StepsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStepsInput, $0.StepRecord>(
        'StreamSteps',
        streamSteps_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetStepsInput.fromBuffer(value),
        ($0.StepRecord value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StepInput, $0.StepResponse>(
        'StreamUserSteps',
        streamUserSteps,
        true,
        true,
        ($core.List<$core.int> value) => $0.StepInput.fromBuffer(value),
        ($0.StepResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.StepResponse> recordSteps_Pre($grpc.ServiceCall call, $async.Future<$0.StepInput> request) async {
    return recordSteps(call, await request);
  }

  $async.Future<$0.StepsResponse> getStepsByUser_Pre($grpc.ServiceCall call, $async.Future<$0.GetStepsInput> request) async {
    return getStepsByUser(call, await request);
  }

  $async.Stream<$0.StepRecord> streamSteps_Pre($grpc.ServiceCall call, $async.Future<$0.GetStepsInput> request) async* {
    yield* streamSteps(call, await request);
  }

  $async.Future<$0.StepResponse> recordSteps($grpc.ServiceCall call, $0.StepInput request);
  $async.Future<$0.StepsResponse> getStepsByUser($grpc.ServiceCall call, $0.GetStepsInput request);
  $async.Stream<$0.StepRecord> streamSteps($grpc.ServiceCall call, $0.GetStepsInput request);
  $async.Stream<$0.StepResponse> streamUserSteps($grpc.ServiceCall call, $async.Stream<$0.StepInput> request);
}
