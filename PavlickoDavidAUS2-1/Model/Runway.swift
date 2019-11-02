//
//  Runway.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 29/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Runway {
    
    var _airplane: Airplane?
    private let _id: Int
    let _type: RunwayType?
    var _departures: Array<Departure> = Array()
    
    init(_ id: Int, _ type: RunwayType) {
        self._id = id
        self._type = type
    }
    
    init(_ id: Int) {
        self._id = id
        self._type = nil
    }
    
    var airplane: Airplane? {
        get {
            return self._airplane
        }
    }
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    var type: RunwayType? {
        get {
            return self._type
        }
    }
    
    var departures: Array<Departure> {
        get {
            return self._departures
        }
    }
    
    public func addDeparture(_ airplane: Airplane) -> Array<Departure> {
        
        self._departures.append(Departure(airplane, airplane.departureTime?.dateToString() ?? "-"))
        return self.departures
    }
    
    static let comparator: Comparator = {
        lhs, rhs in guard let first = lhs as? Runway, let second = rhs as? Runway else {
            return ComparisonResult.orderedSame
        }
        
        if (first.id == second.id) {
            return ComparisonResult.orderedSame
        } else if (first.id < second.id) {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedDescending
        }
    }
}
