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

            self.generator.pairingHeapGen(loop: 100000, insert: 3, change: 3, delete: 3, progressBar: nil)
            
//            let pairingHeap: PairingHeap<Int, Int> = PairingHeap<Int, Int>(Int.comparator)
//            let test3 = pairingHeap.insert(14, key: -1)
//            _ = pairingHeap.insert(12, key: -1)
//            _ = pairingHeap.insert(0, key: -1)
//            _ = pairingHeap.insert(5, key: -1)
//            let test2 = pairingHeap.insert(5, key: -1)
//            let test = pairingHeap.insert(2, key: -1)
//            _ = pairingHeap.insert(0, key: -1)
//            
//            test._value = 14
//            pairingHeap.decrease(test)
//            
//            test2._value = 2
//            pairingHeap.increase(test2)
//            
//            test3._value = 22
//            pairingHeap.decrease(test3)
//
//            print("\(pairingHeap.getCount())")
//            
//            print(self.generator.pairingHeap as Any)
            
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
