import 'dart:async';
import 'package:flutter/services.dart';

final class StepCounterChannel {
  static const _channel = MethodChannel('step_counter');
  final _stepStreamController = StreamController<int>.broadcast();

  // 스트림 Getter
  Stream<int> get stepStream => _stepStreamController.stream;

  StepCounterChannel() {
    // Native에서 데이터를 받는 핸들러 설정
    _channel.setMethodCallHandler(_handleNativeCall);
  }

  // 네이티브에서 전달된 데이터를 스트림에 추가
  Future<void> _handleNativeCall(MethodCall call) async {
    if (call.method == 'onStepCount') {
      final stepCount = call.arguments as int? ?? 0;
      _stepStreamController.add(stepCount);
    }
  }

  // Native에 걸음 수 시작 요청
  Future<void> startPedometer() async {
    try {
      await _channel.invokeMethod('startPedometer');
    } catch (e) {
      throw Exception('Failed to start pedometer: $e');
    }
  }

  // Native에 걸음 수 중지 요청
  Future<void> stopPedometer() async {
    try {
      await _channel.invokeMethod('stopPedometer');
    } catch (e) {
      throw Exception('Failed to stop pedometer: $e');
    }
  }

  // 스트림 종료 (필요 시 호출)
  void dispose() => _stepStreamController.close();

}
