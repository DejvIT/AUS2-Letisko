//
//  Departure.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 31/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Departure {
    
    private let _airplane: Airplane
    private let _arrival: DateTime?
    private let _request: DateTime?
    private let _departure: DateTime?
    private let _runwayID: Int
    
    init(_ airplane: Airplane, _ arrival: DateTime?, _ request: DateTime?, _ departure: DateTime?, _ runwayID: Int) {
        self._airplane = airplane
        self._arrival = arrival
        self._request = request
        self._departure = departure
        self._runwayID = runwayID
    }
    
    var airplane: Airplane {
        get {
            return self._airplane
        }
    }
    
    var arrival: DateTime? {
        get {
            return self._arrival
        }
    }
    
    var request: DateTime? {
        get {
            return self._request
        }
    }
    
    var departure: DateTime? {
        get {
            return self._departure
        }
    }
    
    var runwayID: Int {
        get {
            return self._runwayID
        }
    }
    
    public func toExport() -> String {
        return "\(airplane.code);\(arrival?.toExport() ?? "nil");\(request?.toExport() ?? "nil");\(departure?.toExport() ?? "nil");\(runwayID)\n"
    }
}
