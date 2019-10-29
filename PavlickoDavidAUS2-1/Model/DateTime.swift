//
//  DateTime.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 29/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class DateTime {
    
    var _day: Int
    var _month: Int
    var _year: Int
    var _hour: Int
    var _minute: Int
    
    init(day: Int, month: Int, year: Int, hour: Int, minute: Int) {
        
        if day < 1 || day > 30 {
            self._day = 1
        } else {
            self._day = day
        }
        
        if month < 1 || month > 12 {
            self._month = 1
        } else {
            self._month = month
        }
        
        if year < 2000 || day > 2099 {
            self._year = 2000
        } else {
            self._year = year
        }
        
        if hour < 0 || hour > 23 {
            self._hour = 12
        } else {
            self._hour = hour
        }
        
        if minute < 0 || minute > 59 {
            self._minute = 0
        } else {
            self._minute = minute
        }
    }
    
    var day: Int {
        get {
            return self._day
        }
    }
    
    var month: Int {
        get {
            return self._month
        }
    }
    
    var year: Int {
        get {
            return self._year
        }
    }
    
    var hour: Int {
        get {
            return self._hour
        }
    }
    
    var minute: Int {
        get {
            return self._minute
        }
    }
    
    public func dateToString () -> String {
        
        var minutes = "00"
        if self.minute > 0 {
            if self.minute < 10 {
                minutes = "0\(self.minute)"
            } else {
                minutes = "\(self.minute)"
            }
        }
        
        var hours = "00"
        if self.hour > 0 {
            if self.hour < 10 {
                hours = "0\(self.hour)"
            } else {
                hours = "\(self.hour)"
            }
        }
        
        return "\(self.day).\(self.month).\(self.year) \(hours):\(minutes)"
    }
    
    public func addTime() {
        self._minute += 10
        
        if (self.minute > 59) {
            self._minute = 0
            self._hour += 1
            
            if (self.hour > 23) {
                self._hour = 0
                self._day += 1
                
                if (self.day > 30) {
                    self._day = 1
                    self._month += 1
                    
                    if (self.month > 12) {
                        self._month = 1
                        self._year += 1
                    }
                }
            }
        }
        
    }
}
