//
//  Airport.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 26/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Airport {
    
    static let shared = Airport()
    
    var _time: Int
    var arrivals: Array<Airplane> = Array()
    var departures: Array<Int> = Array() //TODO class Departure
    var airplanes: SplayTree<Airplane> = SplayTree<Airplane>(Airplane.comparator)
    
    init() {
        self._time = 0
    }
    
    var time: Int {
        return self._time
    }
    
    public func addAirplane(_ airplane: Airplane) -> Airplane? {
        
        if (airplanes.insert(airplane)) {
            return airplane
        } else {
            return nil
        }
        
    }
    
    public func arrival(_ airplane: Airplane) -> Array<Airplane> {
        
        arrivals.append(airplane)
        return self.arrivals
    }
}
