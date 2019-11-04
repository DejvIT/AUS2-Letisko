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
    var arrivals: Array<Arrival> = Array()
    var airplanes: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    var waitingForRunway: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    var runwayTypes: SplayTree<RunwayType>! = SplayTree<RunwayType>(RunwayType.comparator)
    var allRunways: SplayTree<Runway>! = SplayTree<Runway>(Runway.comparator)
    var airplanesInAir: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    
    init() {
        self._time = DateTime(day: 29, month: 19, year: 2019, hour: 12, minute: 0)
    }
    
    var time: DateTime {
        return self._time
    }
    
    public func addAirplane(_ airplane: Airplane) -> Airplane? {
        
        let airplaneInAir = airplanesInAir.search(airplane, delete: false, closest: false)?.value
        
        if (airplaneInAir != nil) {
            
            _ = airplanesInAir.delete(airplaneInAir!)
            airplane.setNonActive()
        }

        _ = waitingForRunway.insert(airplane)
        return airplanes.insert(airplane)
    }
    
    public func addArrival(_ airplane: Airplane) -> Array<Arrival> {
        
        arrivals.append(Arrival(airplane, DateTime(airplane.arrivalTime)))
        return self.arrivals
    }
    
    public func addRunways(quantity: Int, length: Int) {
        
        let runwayType = RunwayType(length)
        let checkType = self.runwayTypes.search(runwayType, delete: false, closest: false)?.value
        var loop = quantity
        
        if (checkType != nil) {
            
            while (loop > 0) {
                loop -= 1
                
                _ = self.allRunways.insert((checkType?.addEmptyRunway(self.allRunways.getCount() + 1))!)
            }
            
        } else {
            let newRunwayType = self.runwayTypes.insert(runwayType)
            
            while (loop > 0) {
                loop -= 1
                
                _ = self.allRunways.insert((newRunwayType?.addEmptyRunway(self.allRunways.getCount() + 1))!)
            }
        }
    }
}
