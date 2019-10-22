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

            self.generator.splayTree(loop: 100000, insert: 10, search: 2, delete: 1, progressBar: nil)
            DispatchQueue.main.async {
                Spinner.removeSpinner(spinner: loadingSpinner)
            }
        }

//        let loadingSpinner = Spinner.purpleBackground(onView: self.view)
//        dataInit.notify(queue: .main) {
//            self.dataInit.enter()
//            self.generator.splayTree(loop: 100000, insert: 1, search: 1, delete: 1, progressBar: nil)
//
//            let pairingHeap: PairingHeap<Int> = PairingHeap<Int>(Int.comparator)
//            var loop = 10
//
//            while loop > 0 {
//                loop -= 1
//                _ = pairingHeap.insert(Int.random(in: 0...10), key: 2)
//            }
//
//            print("\(pairingHeap.getCount())")
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//
//                Spinner.removeSpinner(spinner: loadingSpinner)
//            }
//            self.dataInit.leave()
//        }
        
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
