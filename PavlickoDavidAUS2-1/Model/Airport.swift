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
    
    var _time: DateTime
    var arrivals: Array<String> = Array()
    var airplanes: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    var runwayTypes: SplayTree<RunwayType>! = SplayTree<RunwayType>(RunwayType.comparator)
    var allRunways: SplayTree<Runway>! = SplayTree<Runway>(Runway.comparator)
    var airplanesInAir: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    
    init() {
        self._time = DateTime(day: 29, month: 19, year: 2019, hour: 12, minute: 00)
        let runway1 = runwayTypes.insert(RunwayType(1000))
        _ = allRunways.insert(runway1!.addEmptyRunway(allRunways.getCount() + 1))
        let runway2 = runwayTypes.insert(RunwayType(2000))
        _ = allRunways.insert(runway2!.addEmptyRunway(allRunways.getCount() + 1))
        _ = allRunways.insert(runway2!.addEmptyRunway(allRunways.getCount() + 1))
        _ = allRunways.insert(runway2!.addEmptyRunway(allRunways.getCount() + 1))
        let runway3 = runwayTypes.insert(RunwayType(3000))
        _ = allRunways.insert(runway3!.addEmptyRunway(allRunways.getCount() + 1))
    }
    
    var time: String {
        return self._time.dateToString()
    }
    
    public func addAirplane(_ airplane: Airplane) -> Airplane? {
        
        if (airplanes.insert(airplane) != nil) {
            return airplane
        } else {
            return nil
        }
        
    }
    
    public func addArrival(_ airplane: Airplane) -> Array<String> {
        
        arrivals.append("\(arrivals.count + 1).) \(airplane.toString())")
        return self.arrivals
    }
}
