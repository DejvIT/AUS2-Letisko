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
    private let id: Int
    let type: Int
    
    init(_ id: Int, _ type: Int) {
        self.id = id
        self.type = type
    }
    
    init(_ id: Int) {
        self.id = id
        self.type = 0
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
