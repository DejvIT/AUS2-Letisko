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
    private let _code: String
    private let _minLength: Int
    private let _arrivalTime: DateTime
    var _departureRequest: DateTime?
    var _departureTime: DateTime?
    var _priority: Int?
    var _runway: Runway?
    var _runwayType: RunwayType?
    var _pairingHeapNode: PairingHeapNode<Airplane>?
    
    init(creator: String, code: String, minLength: Int, arrivalTime: DateTime, departureRequest: DateTime?, departureTime: DateTime?, priority: Int?) {
        
        self._creator = creator
        self._code = code
        self._minLength = minLength
        self._arrivalTime = DateTime(arrivalTime)
        self._departureRequest = DateTime(departureRequest)
        self._departureTime = DateTime(departureTime)
        self._priority = priority
    }
    
    deinit {
        print("Airplane instance with code \(self.code) is being deallocated.")
    }
    
    init(code: String) {
        self._creator = ""
        self._code = code
        self._minLength = 0
        self._arrivalTime = DateTime(day: 29, month: 10, year: 2019, hour: 12, minute: 0)
        self._departureRequest = nil
        self._departureTime = nil
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
    
    var arrivalTime: DateTime {
        get {
            return self._arrivalTime
        }
    }
    
    var departureRequest: DateTime? {
        get {
            return self._departureRequest
        }
    }
    
    var departureTime: DateTime? {
        get {
            return self._departureTime
        }
    }
    
    var priority: Int? {
        get {
            return self._priority
        }
    }
    
    var runway: Runway? {
        get {
            return self._runway
        }
    }
    
    var runwayType: RunwayType? {
        get {
            return self._runwayType
        }
    }
    
    var pairingHeapNode: PairingHeapNode<Airplane>? {
        get {
            return self._pairingHeapNode
        }
    }
    
    public func toString() -> String {
        
        return "Lietadlo \(self.code), \(self.creator) s požadovanou dĺžkou dráhy \(self.minLength)m pristalo \(self.arrivalTime.dateToString()), odlet požiadaný na: \(self.departureRequest?.dateToString() ?? "-"), priorita: \(self.priority ?? -1)"
        
    }
    
    public func setNonActive() {
        self._departureTime = nil
        self._priority = -1
        if (self.pairingHeapNode != nil) {
            self.runwayType?.priorityWaiting.deleteNode(self.pairingHeapNode!)
            _ = self.runwayType?.waitingAirplanes.delete(self)
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
    
}
