import Foundation
import CoreMotion
import Combine

class StepCounterManager {
    private let pedometer = CMPedometer()
    private var stepSubject = CurrentValueSubject<Int, Never>(0)
    private var isPedometerRunning = false
    private var backgroundEntryTime: Date? // 백그라운드로 들어간 시점 기록

    var stepPublisher: AnyPublisher<Int, Never> {
        return stepSubject.eraseToAnyPublisher()
    }

    // 실시간 걸음 데이터 시작
    func startStepCounting() {
        guard !isPedometerRunning, CMPedometer.isStepCountingAvailable() else { return }
        isPedometerRunning = true

        pedometer.startUpdates(from: Date()) { [weak self] data, error in
            guard let self = self, let stepData = data, error == nil else { return }
            let stepCount = stepData.numberOfSteps.intValue
            self.stepSubject.send(stepCount)
        }
    }

    // 백그라운드 데이터 가져오기
    func fetchStepsFromBackground() {
        guard let backgroundTime = backgroundEntryTime else { return }
        pedometer.queryPedometerData(from: backgroundTime, to: Date()) { [weak self] data, error in
            guard let self = self, let stepData = data, error == nil else { return }
            let stepCount = stepData.numberOfSteps.intValue
            self.stepSubject.send(stepCount)
        }
    }

    // 만보기 중지
    func stopStepCounting() {
        guard isPedometerRunning else { return }
        pedometer.stopUpdates()
        isPedometerRunning = false
        stepSubject.send(completion: .finished)
    }

    // 앱이 백그라운드로 진입할 때 호출
    func enterBackground() {
        backgroundEntryTime = Date()
        stopStepCounting()
    }

    // 앱이 포그라운드로 복귀할 때 호출
    func enterForeground() {
        fetchStepsFromBackground() // 누적 데이터를 Flutter로 전달
        startStepCounting()        // 실시간 업데이트 재개
    }
}
