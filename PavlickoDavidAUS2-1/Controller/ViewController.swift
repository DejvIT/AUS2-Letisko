//
//  ViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 07/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var generator = Generator.shared
    let dataInit = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        generator.splayTree(loop: 100000, seed: 9, insert: 1, search: 1, delete: 1)
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
    
    @IBAction func onTap(_ sender: UIButton) {

        let loadingSpinner = Spinner.purpleBackground(onView: self.view)
        DispatchQueue.global(qos: .background).async {

            let pairingHeap: PairingHeap<Airplane, String> = PairingHeap<Airplane, String>(Airplane.priorityComparator)
            let ap3 = Airplane(creator: "FRI", code: "FRI01", minLength: 1000, arrivalTime: 5, flightPathAssigned: 2, departureTime: 6, priority: 3)
            let ap5 = Airplane(creator: "FRI", code: "FRI02", minLength: 1000, arrivalTime: 5, flightPathAssigned: 2, departureTime: 6, priority: 5)
            _ = pairingHeap.insert(ap3, key: ap3.code)
            _ = pairingHeap.insert(ap5, key: ap5.code)
            let pairingHeap2: PairingHeap<Airplane, String> = PairingHeap<Airplane, String>(Airplane.priorityComparator)
            let ap4 = Airplane(creator: "FRI", code: "FRI03", minLength: 1000, arrivalTime: 5, flightPathAssigned: 2, departureTime: 6, priority: 4)
            let ap6 = Airplane(creator: "FRI", code: "FRI04", minLength: 1000, arrivalTime: 5, flightPathAssigned: 2, departureTime: 6, priority: 6)
            _ = pairingHeap2.insert(ap4, key: ap4.code)
            _ = pairingHeap2.insert(ap6, key: ap6.code)
            
            
            _ = pairingHeap.mergeTrees(pairingHeap, pairingHeap2)
            let ap10 = Airplane(creator: "FRI", code: "FRI05", minLength: 1000, arrivalTime: 5, flightPathAssigned: 2, departureTime: 6, priority: 10)
            let test = pairingHeap.insert(ap10, key: ap10.code)
            
            test.value._priority = -1
            pairingHeap.deleteNode(test)
            
            print("\(pairingHeap.getCount())")
            
            DispatchQueue.main.async {
                Spinner.removeSpinner(spinner: loadingSpinner)
            }
        }
        
    }
    
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
