//
//  TimerViewModelTests.swift
//  Meditation Timer Tests
//
//  Created by Marius Malyshev on 22.05.2023.
//

import XCTest
@testable import Meditation_Timer

class TimerViewModelTests: XCTestCase {
    
    var viewModel: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TimerViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testTimeString() {
        let time = 125
        let expectedTimeString = "02:05"
        XCTAssertEqual(viewModel.timeString(time: time), expectedTimeString)
    }
    
    func testStartTimer() {
        viewModel.startTimer()
        XCTAssertNotNil(viewModel.timer)
        XCTAssertTrue(viewModel.isTimerRunning)
    }
    
    func testPauseTimer() {
        viewModel.startTimer()
        viewModel.pauseTimer()
        XCTAssertNil(viewModel.timer)
        XCTAssertFalse(viewModel.isTimerRunning)
    }
    
    func testResetTimer() {
        viewModel.resetTimer()
        XCTAssertNil(viewModel.timer)
        XCTAssertFalse(viewModel.isTimerRunning)
        XCTAssertEqual(viewModel.secondsPassed, 120)
    }
}

