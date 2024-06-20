//
//  TimingAdjustableViewModel.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import Foundation

class TimingAdjustableViewModel: ObservableObject {
    @Published var currentPage = 0
    @Published var imageNames = [
        "carousel1",
        "carousel2",
        "carousel3",
    ]
    @Published var isPaused = true

    var timer: Timer?
    var currentInterval: TimeInterval = 0

    func createTimer(interval: TimeInterval) {
        timer?.invalidate()
        currentInterval = interval
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            guard let self else { return }

            currentPage = (currentPage + 1) % imageNames.count
        }
        isPaused = false
    }

    func pauseStartTimer() {
        if !isPaused {
            timer?.invalidate()
            isPaused = true
        } else {
            createTimer(interval: currentInterval)
        }
    }
}
