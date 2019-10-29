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
    
    @IBAction func onTap(_ sender: UIButton) {

        let loadingSpinner = Spinner.purpleBackground(onView: self.view)
        DispatchQueue.global(qos: .background).async {

            self.generator.pairingHeapGen(loop: 20, insert: 3, change: 3, delete: 10, progressBar: nil)
            
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
