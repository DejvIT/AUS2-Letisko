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
    var pairingHeap: PairingHeap<Int>! = PairingHeap<Int>(Int.comparator)
    var arrayPNodes : Array<PairingHeapNode<Int>> = Array()
    
    // MARK: - Splay Tree
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
                
                if (splayTree.insert(randomNumber) != nil) {

                    print("\(loop + 1).) 😊 Inserting number \(randomNumber) 🤪")
                    arrayNumbers.append(randomNumber)
                } else {
                    loop += 1
                }
                
            } else if (random <= (insertRatio + searchRatio)) {
                
                let randomNumber = Int.random(in: 0 ... loop*4)
                print("\(loop + 1).) 😎 Searching number \(String(describing: randomNumber)) 😂")
                _ = splayTree.search(randomNumber, delete: false, closest: false)
                
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
        print("Inorder of splay tree: \(splayTree.inOrder())")
        print("Count of numbers in the Array list = \(arrayNumbers.count)")
        print("Inorder of array list: \(arrayNumbers.sorted())")
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
            _ = splayTree.search(randomNumber, delete: false, closest: false)

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
    
    // MARK: - Pairing Heap
    public func pairingHeapGen(loop: Int, insert: Int, change: Int, delete: Int, progressBar: UIProgressView?) {

        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        let insertRatio: Double = Double(insert) / (Double(insert) + Double(change) + Double(delete))
        let changeRatio: Double = Double(change) / (Double(insert) + Double(change) + Double(delete))
        let deleteRatio: Double = Double(delete) / (Double(insert) + Double(change) + Double(delete))
        
        while loop > 0 {
            loop -= 1
            
            print("Number of nodes in pairing heap is \(pairingHeap.getCount())")
            
            if hundreth > 0 {
                if loop % hundreth == 0 && progressBar != nil {
                    DispatchQueue.main.async {
                        progressBar?.progress += 0.01
                    }
                }
            }
            
            let random: Double = Double.random(in: 0...1)
            if (random <= insertRatio) {

                let randomNumber = Int.random(in: 0 ... pairingHeap.getCount() * 4)
                print("\(loop + 1).) 😊 Inserting number \(randomNumber) 🤪")
                arrayPNodes.append(pairingHeap.insert(randomNumber))
                
            } else if (random <= (insertRatio + changeRatio)) {
                
                if (arrayPNodes.count > 0) {

                    let randomNode = arrayPNodes.randomElement()
                    let randomNumber = Int.random(in: 0 ... pairingHeap.getCount() * 4)
                    
                    if (randomNode!.value < randomNumber) {
                        print("\(loop + 1).) Decreasing from \(String(describing: randomNode?.value)) to \(randomNumber)")
                        randomNode?._value = randomNumber
                        pairingHeap.decrease(randomNode!)
                    } else {
                        print("\(loop + 1).) Increasing from \(String(describing: randomNode?.value)) to \(randomNumber)")
                        randomNode?._value = randomNumber
                        pairingHeap.increase(randomNode!)
                    }
                } else {
                    loop += 1
                }
                
                
            } else if (random <= (insertRatio + changeRatio + deleteRatio)) {
                
                if (arrayPNodes.count > 0) {
                    
                    let randomIndex = Int.random(in: 0...arrayPNodes.count - 1)
                    let randomNode = arrayPNodes[randomIndex]
                    arrayPNodes.remove(at: randomIndex)
                    print("\(loop + 1).) 😭 Deleting number \(randomNode.value) 😩")
                    randomNode._value = -1
                    pairingHeap.deleteNode(randomNode)
                    
                } else {
                    loop += 1
                }
                
            } else {
                print("Some shit has happened! 😩😭😡")
            }
        }
        
        var min = Int.max / 2
        for node in arrayPNodes {
            if node.value < min {
                min = node.value
            }
        }
        
        print("Count of numbers in Pairing heap = \(pairingHeap.getCount())")
        print("Count of numbers in the Array list = \(arrayPNodes.count)")
        if pairingHeap.getRoot() != nil {
            print("The highest priority in heap is \(pairingHeap.getRoot()!._value)")
            print("The highest priority in array is \(min)")
        }
            
    }
    
    public func pairingHeapInsert(loop: Int, progressBar: UIProgressView?) {
        
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if (hundreth > 0) {

                if loop % hundreth == 0 && progressBar != nil {
                    DispatchQueue.main.async {
                        progressBar?.progress += 0.01
                    }
                }
            }
            
            let randomNumber = Int.random(in: 0 ... loop * 4)
            print("\(loop + 1).) 😊 Trying to insert number \(randomNumber)")
            arrayPNodes.append(pairingHeap.insert(randomNumber))
        }
    }
    
    public func pairingHeapDelete(loop: Int, progressBar: UIProgressView?) {
    
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
            
            if (arrayPNodes.count > 0) {

                let randomIndex = Int.random(in: 0...arrayPNodes.count - 1)
                let randomNode = arrayPNodes[randomIndex]
                arrayPNodes.remove(at: randomIndex)
                _ = pairingHeap.deleteNode(randomNode)
                print("\(loop + 1).) 😭 Remove \(randomNode.value) from pairing heap.")
                
            }

        }
    }
    
    public func pairingHeapChange(loop: Int, progressBar: UIProgressView?) {
    
        var loop = loop
        let hundreth: Int = Int(Double(loop) / Double(100))
        
        while loop > 0 {
            loop -= 1
            
            if loop % hundreth == 0 && progressBar != nil {
                DispatchQueue.main.async {
                    progressBar?.progress += 0.01
                }
            }
            
            if (arrayPNodes.count > 0) {

                let randomNode = arrayPNodes.randomElement()
                let randomNumber = Int.random(in: 0 ... arrayPNodes.count * 4)
                
                if (randomNode!.value < randomNumber) {
                    print("\(loop + 1).) Decreasing from \(String(describing: randomNode?.value)) to \(randomNumber)")
                    randomNode?._value = randomNumber
                    pairingHeap.decrease(randomNode!)
                } else {
                    print("\(loop + 1).) Increasing from \(String(describing: randomNode?.value)) to \(randomNumber)")
                    randomNode?._value = randomNumber
                    pairingHeap.increase(randomNode!)
                }
            }

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
