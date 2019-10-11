//
//  ViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 07/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!

    var testTree: BinaryTree<Airplane>! = BinaryTree<Airplane>(Airplane.comparator)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        
//        _ = testLevelOrder(bst: testTree)
//        let results = testTree.levelOrder()
        
        let result = testTree.search(Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 1))
        
        testLabel.text = "\(result)"
    }
    
    public func test() {
        
        let randomSeed = 1
        var looper = 10
        
        while looper > 0 {
            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: Int.random(in: 0 ..< randomSeed * 4))
            
            _ = testTree.insert(airplane)
            looper -= 1
        }
    }
    
    public func testLevelOrder(bst: BinaryTree<Airplane>) -> [[Int]] {
        
        var result: [[Int]] = []
        var discoveredNodes: [BinaryNode<Airplane>] = [bst._root!]
        
        while discoveredNodes.count > 0 {
            
            for item in discoveredNodes {

                let pivot = discoveredNodes[0]
                result.append([pivot.value.priority, pivot.h, (pivot.parent?.value.priority ?? -1)])
                
                if (item.left != nil) {
                    discoveredNodes.append(item.left!)
                }
                
                if (item.right != nil) {
                    discoveredNodes.append(item.right!)
                }
                
                discoveredNodes.remove(at: 0)
            }
        }
        
        return result
    }

}

