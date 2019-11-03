//
//  Runway.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 29/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class RunwayType {
    
    var _length: Int
    var waitingAirplanes: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    var priorityWaiting: PairingHeap<Airplane>! = PairingHeap<Airplane>(Airplane.priorityComparator)
    var runways: Array<Runway> = Array()
    
    init(_ length: Int) {
        self._length = length
    }
    
    var length: Int {
        get {
            return self._length
        }
    }
    
    public func addRequest(_ airplane: Airplane) {
        _ = waitingAirplanes.insert(airplane)
    }
    
    public func addWaiting(_ airplane: Airplane) {
        _ = priorityWaiting.insert(airplane)
    }
    
    static let comparator: Comparator = {
        lhs, rhs in guard let first = lhs as? RunwayType, let second = rhs as? RunwayType else {
            return ComparisonResult.orderedSame
        }
        
        if (first.length == second.length) {
            return ComparisonResult.orderedSame
        } else if (first.length < second.length) {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedDescending
        }
    }
    
    public func addEmptyRunway(_ id: Int) -> Runway {
        let runway = Runway(id, self)
        runways.append(runway)
        return runway
    }
    
    public func manageAirplane(_ airplane: Airplane) {
        
        var airplaneOnRunway = false
        for runway in runways {
            if runway._airplane == nil {
                runway._airplane = airplane
                airplane._runway = runway
                airplaneOnRunway = true
                break
            }
        }
        if !airplaneOnRunway {
            _ = waitingAirplanes.insert(airplane)
            airplane._pairingHeapNode = priorityWaiting.insert(airplane)
        }
        
        airplane._runwayType = self
    }
    
    public func toExport() -> String {
        return "\(self.length)\n"
    }
}
