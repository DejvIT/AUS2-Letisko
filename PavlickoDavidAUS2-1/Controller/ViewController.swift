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

    var binarySearchTree: BinaryTree<Airplane>! = BinaryTree<Airplane>(Airplane.comparator)
    
    var result: [Airplane] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
        
//        _ = testLevelOrder(bst: testTree)
//        result = testTree.levelOrder()
        let result = binarySearchTree.search(Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 100))
        
        print("Number of nodes in the tree: \(binarySearchTree.getCount())")
        binarySearchTree.debugDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        testLabel.text = "AhOJ"
    }
    
    public func test() {
        
//        let ap40 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 40)
//        let ap30 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 30)
//        let ap50 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 50)
//        let ap20 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 20)
//        let ap35 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 35)
//        let ap45 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 45)
//        let ap60 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 60)
//        let ap10 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 10)
//        let ap25 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 25)
//        let ap32 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 32)
//        let ap38 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 38)
//        let ap41 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 41)
//        let ap70 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 70)
//        let ap80 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 80)
//        let ap75 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 75)
//        let ap90 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 90)
//        let ap55 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 55)
//        let ap58 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 58)
//        let ap65 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 65)
//        let ap43 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 43)
//        let ap44 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 44)
//        let ap42 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 42)
//        let ap39 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 39)
//        let ap31 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 31)
//        let ap33 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 33)
//        let ap15 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 15)
//        let ap22 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 22)
//        let ap24 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 24)
//        let ap23 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 23)
//        let ap28 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 28)
//        let ap29 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 29)
//        let ap34 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 34)
//
//        print("Number of nodes in the tree: \(binarySearchTree.getCount())")
//        _ = binarySearchTree.insert(ap40)
//        _ = binarySearchTree.insert(ap30)
//        _ = binarySearchTree.insert(ap50)
//        _ = binarySearchTree.insert(ap20)
//        _ = binarySearchTree.insert(ap35)
//        _ = binarySearchTree.insert(ap45)
//        _ = binarySearchTree.insert(ap60)
//        _ = binarySearchTree.insert(ap10)
//        _ = binarySearchTree.insert(ap25)
//        _ = binarySearchTree.insert(ap32)
//        _ = binarySearchTree.insert(ap38)
//        _ = binarySearchTree.insert(ap41)
//        _ = binarySearchTree.insert(ap60)
//        _ = binarySearchTree.insert(ap55)
//        _ = binarySearchTree.insert(ap70)
//        _ = binarySearchTree.insert(ap15)
//        _ = binarySearchTree.insert(ap22)
//        _ = binarySearchTree.insert(ap28)
//        _ = binarySearchTree.insert(ap31)
//        _ = binarySearchTree.insert(ap33)
//        _ = binarySearchTree.insert(ap39)
//        _ = binarySearchTree.insert(ap43)
//        _ = binarySearchTree.insert(ap58)
//        _ = binarySearchTree.insert(ap65)
//        _ = binarySearchTree.insert(ap80)
//        _ = binarySearchTree.insert(ap24)
//        _ = binarySearchTree.insert(ap23)
//        _ = binarySearchTree.insert(ap29)
//        _ = binarySearchTree.insert(ap34)
//        _ = binarySearchTree.insert(ap42)
//        _ = binarySearchTree.insert(ap44)
//        _ = binarySearchTree.insert(ap75)
//        _ = binarySearchTree.insert(ap90)
//        print("Number of nodes in the tree: \(binarySearchTree.getCount())")
//
//        _ = binarySearchTree.delete(ap20)
//        _ = binarySearchTree.delete(ap35)
//        _ = binarySearchTree.delete(ap60)
//        _ = binarySearchTree.delete(ap50)
//        _ = binarySearchTree.delete(ap40)

        
        
        
        
        
        let randomSeed = 100
        var looper = 1000

        while looper > 0 {
            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: Int.random(in: 0 ..< randomSeed * 4))

            _ = binarySearchTree.insert(airplane)
            looper -= 1
        }
    }
    
    public func testLevelOrder(bst: BinaryTree<Airplane>) -> [[Int]] {
        
        var result: [[Int]] = []
        var discoveredNodes: [BinaryNode<Airplane>] = [bst._root!]
        
        while discoveredNodes.count > 0 {
            
            for item in discoveredNodes {

                let pivot = discoveredNodes[0]
                result.append([pivot.value.priority, pivot.parent?.value.priority ?? -1])
                
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

