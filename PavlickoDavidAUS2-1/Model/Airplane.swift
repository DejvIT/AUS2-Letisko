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
    private let _arrivalTime: String
    var _departureRequest: String?
    var _departureTime: String?
    var _priority: Int?
    var _runway: Runway?
    
    init(creator: String, code: String, minLength: Int, arrivalTime: String, departureRequest: String?, departureTime: String?, priority: Int?) {
        
        self._creator = creator
        self._code = code
        self._minLength = minLength
        self._arrivalTime = arrivalTime
        self._departureRequest = departureRequest
        self._departureTime = departureTime
        self._priority = priority
    }
    
    deinit {
        print("Airplane instance with code \(self.code) is being deallocated.")
    }
    
    init(code: String) {
        self._creator = ""
        self._code = code
        self._minLength = 0
        self._arrivalTime = "29.10.2019 12:00"
        self._departureRequest = "29.10.2019 12:00"
        self._departureTime = "29.10.2019 12:00"
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
    
    var arrivalTime: String {
        get {
            return self._arrivalTime
        }
    }
    
    var departureRequest: String? {
        get {
            return self._departureRequest
        }
    }
    
    var departureTime: String? {
        get {
            return self._departureTime
        }
    }
    
    var priority: Int? {
        get {
            return self._priority
        }
    }
    
    static let comparator: Comparator = {
        lhs, rhs in guard let first = lhs as? Airplane, let second = rhs as? Airplane else {
            return ComparisonResult.orderedSame
        }
        
        if (first.code == second.code) {
            return ComparisonResult.orderedSame
        } else if (first.code < second.code) {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedDescending
        }
    }
    
    static let priorityComparator: Comparator = {
        lhs, rhs in guard let first = lhs as? Airplane, let second = rhs as? Airplane else {
            return ComparisonResult.orderedSame
        }
        
        if (first.priority == second.priority) {
            return ComparisonResult.orderedSame
        } else if (first.priority! < second.priority!) {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedDescending
        }
    }
    
    public func toString() -> String {
        
        return "Lietadlo \(self.code), \(self.creator) s požadovanou dĺžkou dráhy \(self.minLength)m pristalo v čase \(self.arrivalTime), požiadavka na odlet v čase: \(self.departureRequest ?? "-"), priorita: \(self.priority ?? -1)"
        
    }
    
}
