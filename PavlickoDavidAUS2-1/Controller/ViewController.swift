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

//    var binarySearchTree: BinaryTree<Airplane>! = BinaryTree<Airplane>(Airplane.comparator)
    var splayTree: SplayTree<Airplane>! = SplayTree<Airplane>(Airplane.comparator)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test()
        
        let generator = Generator()
        generator.splayTree(loop: 100000, seed: 9, insert: 8, search: 1, delete: 1)
//        generator.splayTreeInsert(loop: 1000000, seed: 9)
//        generator.splayTreeSearch(loop: 1000000, seed: 9)
//        generator.splayTreeDelete(loop: 1000000, seed: 9)
        let result = generator.splayTree
        
//        _ = testLevelOrder(bst: testTree)
//        result = testTree.levelOrder()
//        let result = binarySearchTree.search(Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 100))
        
        print("Number of nodes in the tree: \(result!.getCount())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        testLabel.text = "AhOJ"
    }
    
    public func test() {
        
//        let ap40 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 40)
//        let ap30 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 30)
//        let ap50 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 50)
//        let ap20 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 20)
//        let ap28 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 28)
//        let ap45 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 45)
//        let ap60 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 60)
//        let ap10 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 10)
//        let ap15 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 15)
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
//        let ap48 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 48)
//        let ap42 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 42)
//        let ap39 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 39)
//        let ap31 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 31)
//        let ap33 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 33)
//        let ap15 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 15)
//        let ap22 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 22)
//        let ap24 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 24)
//        let ap23 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 23)
//        let ap29 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 29)
//        let ap47 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 47)
//
//        print("Number of nodes in the tree: \(binarySearchTree.getCount())")
        
        let ap7 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 7)
        let ap5 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 5)
        let ap2 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 2)
        let ap9 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 9)
        let ap17 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 17)
        let ap8 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 8)
        let ap1 = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: 1)
        _ = splayTree.insert(ap7)
        _ = splayTree.insert(ap5)
        _ = splayTree.insert(ap2)
        _ = splayTree.insert(ap9)
        _ = splayTree.insert(ap17)
        _ = splayTree.insert(ap8)
        _ = splayTree.insert(ap1)
//        _ = splayTree.insert(ap48)
//        _ = splayTree.insert(ap47)
//        _ = splayTree.insert(ap20)
//        _ = splayTree.insert(ap10)
//        _ = splayTree.insert(ap15)
//        _ = splayTree.insert(ap32)
//        _ = splayTree.insert(ap30)
//        _ = splayTree.insert(ap42)
        
//        _ = binarySearchTree.insert(ap35)
//        _ = binarySearchTree.insert(ap45)
//        _ = binarySearchTree.insert(ap60)
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
        
        print("Number of nodes in the tree: \(splayTree.getCount())")
        
//        _ = splayTree.delete(ap20)  //OK
//        _ = splayTree.delete(ap60)  //OK
//        _ = splayTree.delete(ap50)  //OK
//        _ = splayTree.delete(ap40)  //OK
//
//        _ = splayTree.search(ap10, delete: false)
//        _ = splayTree.search(ap50, delete: false)
//        _ = splayTree.search(ap42, delete: false)
//
//        _ = splayTree.delete(ap30)  //OK
//
//        _ = splayTree.search(ap33, delete: false)
//
//        _ = splayTree.search(ap45, delete: false)
//        _ = splayTree.delete(ap10)  //OK
//        _ = splayTree.delete(ap45)  //OK
//        _ = splayTree.delete(ap48)  //OK
        
        _ = splayTree.delete(ap17)
        
        print("Number of nodes in the tree: \(splayTree.getCount())")
        
//        let randomSeed = 100
//        var looper = 1000
//
//        while looper > 0 {
//            let airplane = Airplane(creator: "Test s.r.o.", code: "001", minLength: 2500, arrivalTime: 5, flightPathAssigned: 1, departureTime: 0, priority: Int.random(in: 0 ..< randomSeed * 4))
//
//            _ = binarySearchTree.insert(airplane)
//            looper -= 1
//        }
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

