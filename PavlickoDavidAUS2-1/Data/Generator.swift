//
//  Generator.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 16/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class Generator {

    var splayTree: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    
    public func splayTree(loop: Int, seed: Int, insert: Int, search: Int, delete: Int) {
        
        var loop = loop
        let insertRatio: Double = Double(insert) / (Double(insert) + Double(search) + Double(delete))
        let searchRatio: Double = Double(search) / (Double(insert) + Double(search) + Double(delete))
        let deleteRatio: Double = Double(delete) / (Double(insert) + Double(search) + Double(delete))
        var arrayNumbers: [Int] = []
        
        while loop > 0 {
            loop -= 1
            
            let random: Double = Double.random(in: 0...1)
            if (random <= insertRatio) {

                let randomPriority = Int.random(in: 0 ... loop*4)
                
                let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: randomPriority)
                
                if (!arrayNumbers.contains(randomPriority)) {
                    print("\(loop + 1).) 😊 Insert airplane with priority \(airplane.priority) 🤪")

                    arrayNumbers.append(randomPriority)
                    _ = splayTree.insert(airplane)
                } else {
                    loop += 1
                }
            } else if (random <= (insertRatio + searchRatio)) {
                
                if (arrayNumbers.count > 0) {

                    let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: arrayNumbers.randomElement()!)
                    
                    print("\(loop + 1).) 😎 Search airplane with priority \(airplane.priority) 😂")
                    _ = splayTree.search(airplane, delete: false)
                } else {
                    loop += 1
                }
            } else if (random <= (insertRatio + searchRatio + deleteRatio)) {
                
                if (arrayNumbers.count > 0) {

                    let deletePriority = arrayNumbers.randomElement()!
                    if let index = arrayNumbers.firstIndex(of: deletePriority) {
                        arrayNumbers.remove(at: index)
                    }
                    let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: deletePriority)
                    
                    print("\(loop + 1).) 😭 Delete airplane with priority \(airplane.priority) 😩")
                    _ = splayTree.delete(airplane)
                } else {
                    loop += 1
                }
            } else {
                print("Some shit has happened! 😩😭😡")
            }
        }
    }
    
    public func splayTreeInsert(loop: Int, seed: Int) {
        
        var loop = loop
        
        while loop > 0 {
            loop -= 1
            
            let randomPriority = Int.random(in: 0 ... loop*4)
            
            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: randomPriority)
            
            _ = splayTree.insert(airplane)

            print("\(loop + 1).) 😊 Trying to insert airplane with priority \(airplane.priority)")
        }
    }
    
    public func splayTreeSearch(loop: Int, seed: Int) {
        
        var loop = loop
        
        while loop > 0 {
            loop -= 1
            
            let randomPriority = Int.random(in: 0 ... loop*4)
            
            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: randomPriority)
            
            _ = splayTree.search(airplane, delete: false)

            print("\(loop + 1).) 😎 Trying to search airplane with priority \(airplane.priority)")
        }
    }
    
    public func splayTreeDelete(loop: Int, seed: Int) {
        
        var loop = loop
        
        while loop > 0 {
            loop -= 1
            
            let randomPriority = Int.random(in: 0 ... loop*4)
            
            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: randomPriority)
            
            _ = splayTree.delete(airplane)

            print("\(loop + 1).) 😭 Trying to delete airplane with priority \(airplane.priority)")
        }
    }
}
