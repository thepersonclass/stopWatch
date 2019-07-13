//
//  Time.swift
//  Stopwatch
//
//  Created by Daniel Favano on 7/10/19.
//  Copyright © 2019 Daniel Favano. All rights reserved.
//

import Foundation

class Time {
    
    var Hours : Int
    var Minutes : Int
    var Seconds : Int
    
    init(Seconds: Int) {
        self.Seconds = Seconds
        self.Minutes = 00
        self.Hours = 00
        
        calculateHoursMinutesSeconds()
    }
    
    func secondsAsString() -> String {
        return addZeroToTime(time: Seconds)
    }
    
    func minutesAsString() -> String {
        return addZeroToTime(time: Minutes)
    }
    
    func hoursAsString() -> String {
        return addZeroToTime(time: Hours)
    }
    
    private func calculateHoursMinutesSeconds() {
        
        let secondsInAnHour : Int = 3600
        let secondsInAMinute : Int = 60
        
        if(self.Seconds / secondsInAnHour >= 99) {
            self.Hours = 99
            self.Minutes = 00
            self.Seconds = 00
            
            return
        }
        
        self.Hours = self.Seconds / secondsInAnHour
        self.Minutes = (self.Seconds % secondsInAnHour) / secondsInAMinute
        self.Seconds = (self.Seconds % secondsInAnHour) % secondsInAMinute
    }
    
    private func addZeroToTime(time : Int) -> String {
        var result : String
        
        let timeAsString = String(time)
        
        if(time < 10) {
            result = "0" + timeAsString
        }
        else {
            result = timeAsString
        }
        
        return result
    }
}
