//
//  Airplane.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 07/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Airplane {
    
    private let _creator: String
    private let _code: String   //unique identifier
    private let _minLength: Int
    private let _arrivalTime: Int
    private let _flightPathAssigned: Int
    private let _departureTime: Int
    private let _priority: Int
    
    init(creator: String, code: String, minLength: Int, arrivalTime: Int, flightPathAssigned: Int, departureTime: Int, priority: Int) {
        
        self._creator = creator
        self._code = code
        self._minLength = minLength
        self._arrivalTime = arrivalTime
        self._flightPathAssigned = flightPathAssigned
        self._departureTime = departureTime
        self._priority = priority
    }
    
    deinit {
//        print("Airplane instance with priority \(self.priority) is being deallocated.")
    }
    
    init(code: String) {
        self._creator = ""
        self._code = code
        self._minLength = 0
        self._arrivalTime = 0
        self._flightPathAssigned = 0
        self._departureTime = 0
        self._priority = 0
    }
    
    var creator: String {
        get {
            return self._creator
        }
    }
    
    var code: String {
        get {
            return self._code
        }
    }
    
    var minLength: Int {
        get {
            return self._minLength
        }
    }
    
    var arrivalTime: Int {
        get {
            return self._arrivalTime
        }
    }
    
    var flightDepartureTime: Int {
        get {
            return self._flightPathAssigned
        }
    }
    
    var departureTime: Int {
        get {
            return self._departureTime
        }
    }
    
    var priority: Int {
        get {
            return self._priority
        }
    }
    
    static let comparator: Comparator = {
        lhs, rhs in guard let first = lhs as? Airplane, let second = rhs as? Airplane else {
            return ComparisonResult.orderedSame
        }
        
        if (first.priority == second.priority) {
            return ComparisonResult.orderedSame
        } else if (first.priority < second.priority) {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedDescending
        }
    }
    
}
