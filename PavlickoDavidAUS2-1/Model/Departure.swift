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
    private let _time: String
    private let _runwayID: Int
    
    init(_ airplane: Airplane, _ time: String, _ runwayID: Int) {
        self._airplane = airplane
        self._time = time
        self._runwayID = runwayID
    }
    
    var airplane: Airplane {
        get {
            return self._airplane
        }
    }
    
    var time: String {
        get {
            return self._time
        }
    }
    
    var runwayID: Int {
        get {
            return self._runwayID
        }
    }
    
    public func toExport() -> String {
        return "\(airplane.code);\(time);\(runwayID)\n"
    }
}
