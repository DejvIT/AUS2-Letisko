//
//  Arrival.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 31/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Arrival {
    
    private let _airplane: Airplane
    private let _time: DateTime
    
    init(_ airplane: Airplane, _ time: DateTime) {
        self._airplane = airplane
        self._time = time
    }
    
    var airplane: Airplane {
        get {
            return self._airplane
        }
    }
    
    var time: DateTime {
        get {
            return self._time
        }
    }
    
    public func toExport() -> String {
        return "\(airplane.code);\(time.toExport())\n"
    }
}
