//
//  StopwatchTests.swift
//  StopwatchTests
//
//  Created by Daniel Favano on 7/13/19.
//  Copyright © 2019 Daniel Favano. All rights reserved.
//

import XCTest
@testable import Stopwatch

class TimeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCalculateSecondsProperly() {
        
        let testCases : Array = [0, 1, 59]
        
        testCases.forEach{ test in
            
            let time = Time(Seconds: test)
            
            XCTAssertEqual(time.Seconds, test)
            XCTAssertEqual(time.Minutes, 0)
            XCTAssertEqual(time.Hours, 0)
        }
    }
    
    func testShow1SecondAsStringProperly() {
        
        let time = Time(Seconds: 1)
        
        XCTAssertEqual(time.hoursAsString(), "00")
        XCTAssertEqual(time.minutesAsString(), "00")
        XCTAssertEqual(time.secondsAsString(), "01")
    }
    
    func testShow10SecondsAsStringProperly() {
        
        let time = Time(Seconds: 10)
        
        XCTAssertEqual(time.hoursAsString(), "00")
        XCTAssertEqual(time.minutesAsString(), "00")
        XCTAssertEqual(time.secondsAsString(), "10")
    }

    func testCalculate1MinuteProperly() {
        
        let time = Time(Seconds: 60)
        
        XCTAssertEqual(time.Minutes, 1)
        XCTAssertEqual(time.Seconds, 0)
        XCTAssertEqual(time.Hours, 0)
    }
    
    func testShow1MinuteProperlyAsString() {
        
        let time = Time(Seconds: 60)
        
        XCTAssertEqual(time.secondsAsString(), "00")
        XCTAssertEqual(time.hoursAsString(), "00")
        XCTAssertEqual(time.minutesAsString(), "01")
    }
    
    func testShow10MinutesProperlyAsString() {
        
        let time = Time(Seconds: 600)
        
        XCTAssertEqual(time.secondsAsString(), "00")
        XCTAssertEqual(time.hoursAsString(), "00")
        XCTAssertEqual(time.minutesAsString(), "10")
    }
    
    func testCalculateHourProperly() {
        
        let time = Time(Seconds: 3600)
        
        XCTAssertEqual(time.Minutes, 0)
        XCTAssertEqual(time.Seconds, 0)
        XCTAssertEqual(time.Hours, 1)
    }
    
    func testShow1HourProperlyAsString() {
        
        let time = Time(Seconds: 3600)
        
        XCTAssertEqual(time.secondsAsString(), "00")
        XCTAssertEqual(time.hoursAsString(), "01")
        XCTAssertEqual(time.minutesAsString(), "00")
    }
    
    func testShow10HoursProperlyAsString() {
        
        let time = Time(Seconds: 36000)
        
        XCTAssertEqual(time.secondsAsString(), "00")
        XCTAssertEqual(time.hoursAsString(), "10")
        XCTAssertEqual(time.minutesAsString(), "00")
    }
    
    func testCalculateRandomTime() {
        
        let time = Time(Seconds: 3687)
        
        XCTAssertEqual(time.Hours, 1)
        XCTAssertEqual(time.Minutes, 1)
        XCTAssertEqual(time.Seconds, 27)
    }
    
    func testShowRandomTime() {
        
        let time = Time(Seconds: 3687)
        
        XCTAssertEqual(time.hoursAsString(), "01")
        XCTAssertEqual(time.minutesAsString(), "01")
        XCTAssertEqual(time.secondsAsString(), "27")
    }
    
    func testMaxiumTimeCalculation() {
        
        let time = Time(Seconds: 1000000000000000000)
        
        XCTAssertEqual(time.Hours, 99)
        XCTAssertEqual(time.Minutes, 0)
        XCTAssertEqual(time.Seconds, 0)
    }
    
    func testShowMaxiumTimeCalculation() {
        
        let time = Time(Seconds: 1000000000000000000)
        
        XCTAssertEqual(time.hoursAsString(), "99")
        XCTAssertEqual(time.minutesAsString(), "00")
        XCTAssertEqual(time.secondsAsString(), "00")
    }
}
