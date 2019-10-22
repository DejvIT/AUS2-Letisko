//
//  Generator.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 16/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation
import UIKit

class Generator {
    
    static let shared = Generator()
    
    var splayTree: SplayTree<Int>! = SplayTree<Int>(Int.comparator)
    
    public func splayTree(loop: Int, insert: Int, search: Int, delete: Int, progressBar: UIProgressView?) {

        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        let insertRatio: Double = Double(insert) / (Double(insert) + Double(search) + Double(delete))
        let searchRatio: Double = Double(search) / (Double(insert) + Double(search) + Double(delete))
        let deleteRatio: Double = Double(delete) / (Double(insert) + Double(search) + Double(delete))
        var arrayNumbers : Array<Int> = Array()
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
            
            let random: Double = Double.random(in: 0...1)
            if (random <= insertRatio) {

                let randomNumber = Int.random(in: 0 ... loop*4)
                
                if (splayTree.insert(randomNumber)) {

                    print("\(loop + 1).) 😊 Inserting number \(randomNumber) 🤪")
                    arrayNumbers.append(randomNumber)
                } else {
                    loop += 1
                }
                
            } else if (random <= (insertRatio + searchRatio)) {
                
                let randomNumber = Int.random(in: 0 ... loop*4)
                print("\(loop + 1).) 😎 Searching number \(String(describing: randomNumber)) 😂")
                _ = splayTree.search(randomNumber, delete: false)
                
            } else if (random <= (insertRatio + searchRatio + deleteRatio)) {
                
                if (!arrayNumbers.isEmpty) {
                    
                    let randomNumber = arrayNumbers.randomElement()!
                    if (splayTree.delete(randomNumber)) {

                        print("\(loop + 1).) 😭 Deleting number \(String(describing: randomNumber)) 😩")
                        if let index = arrayNumbers.firstIndex(of: randomNumber) {
                            arrayNumbers.remove(at: index)
                        }
                    }
                } else {
                                       
                   loop += 1
               }
                
            } else {
                print("Some shit has happened! 😩😭😡")
            }
        }
        
        print("Count of numbers in Splay tree = \(splayTree.getCount())")
        print("Count of numbers in the Array list = \(arrayNumbers.count)")
    }
    
    public func splayTreeInsert(loop: Int, progressBar: UIProgressView?) {
        
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
            
            let randomNumber = Int.random(in: 0 ... loop*4)
            print("\(loop + 1).) 😊 Trying to insert number \(randomNumber)")
            _ = splayTree.insert(randomNumber)
        }
    }
    
    public func splayTreeSearch(loop: Int, progressBar: UIProgressView?) {
    
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
                
            let randomNumber = Int.random(in: 0 ... loop*4)
            print("\(loop + 1).) 😎 Trying to search number \(randomNumber)")
            _ = splayTree.search(randomNumber, delete: false)

        }
    }
    
    public func splayTreeDelete(loop: Int, progressBar: UIProgressView?) {
    
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
            
            let randomNumber = Int.random(in: 0 ... loop*4)
            print("\(loop + 1).) 😭 Trying to delete number \(randomNumber)")
            _ = splayTree.delete(randomNumber)

        }
    }
}

import GameplayKit
class SeededGenerator: RandomNumberGenerator {
    let seed: UInt64
    private let generator: GKMersenneTwisterRandomSource
    convenience init() {
        self.init(seed: 0)
    }
    init(seed: UInt64) {
        self.seed = seed
        generator = GKMersenneTwisterRandomSource(seed: seed)
    }
    func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(abs(generator.nextInt(upperBound: Int(upperBound))))
    }
    func next<T>() -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(abs(generator.nextInt()))
    }
}

extension Int {
    
    public static let comparator: Comparator = { left, right in
        guard let l = left as? Int, let r = right as? Int else { return ComparisonResult.orderedSame }
        if l > r {
            return ComparisonResult.orderedDescending
        } else if l < r {
            return ComparisonResult.orderedAscending
        } else {
            return ComparisonResult.orderedSame
        }
    }
    
}