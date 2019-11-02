//
//  GeneratorViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 18/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class TestGeneratorViewController: UIViewController, UITextFieldDelegate {
    
    var generator = Generator.shared
    
    @IBOutlet weak var insertRateField: UITextField!
    @IBOutlet weak var searchRateField: UITextField!
    @IBOutlet weak var deleteRateField: UITextField!
    
    
    @IBOutlet weak var hardTestField: UITextField!
    
    @IBOutlet weak var hardTestButton: UIButton!
    
    @IBOutlet weak var hardTestProgressBar: UIProgressView!
    
    @IBOutlet weak var insertField: UITextField!
    @IBOutlet weak var insertProgressBar: UIProgressView!
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchProgressBar: UIProgressView!
    
    @IBOutlet weak var deleteField: UITextField!
    @IBOutlet weak var deleteProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hardTestProgressBar.progress = 0.0
        hardTestProgressBar.isHidden = true
        insertProgressBar.progress = 0.0
        insertProgressBar.isHidden = true
        searchProgressBar.progress = 0.0
        searchProgressBar.isHidden = true
        deleteProgressBar.progress = 0.0
        deleteProgressBar.isHidden = true
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onHardTest(_ sender: Any) {
        
        if (insertRateField.text != "" && searchRateField.text != "" && deleteRateField.text != "" && hardTestField.text != "") {

            hardTestProgressBar.progress = 0.0
            hardTestProgressBar.isHidden = false
            let insertRate: Int = Int(insertRateField.text!)!
            let searchRate: Int = Int(searchRateField.text!)!
            let deleteRate: Int = Int(deleteRateField.text!)!
            let loops: Int = Int(hardTestField.text!)!
            
            DispatchQueue.global(qos: .background).async {
                
                self.generator.splayTree(loop: loops, insert: insertRate, search: searchRate, delete: deleteRate, progressBar: self.hardTestProgressBar)
            }
        }
    }
    
    @IBAction func onInsert(_ sender: Any) {
        print("Insert")
        if (self.insertField.text != "") {
            
            insertProgressBar.progress = 0.0
            insertProgressBar.isHidden = false
            let loops = Int(insertField.text!)!
            DispatchQueue.global(qos: .background).async {
                self.generator.splayTreeInsert(loop: loops, progressBar: self.insertProgressBar)
                print("Number of nodes in the list: \(self.generator.splayTree.getCount())")
            }
        }
    }
    
    @IBAction func onSearch(_ sender: Any) {
        print("Search")
        if (self.searchField.text != "") {
            
            searchProgressBar.progress = 0.0
            searchProgressBar.isHidden = false
            let loops = Int(searchField.text!)!
            DispatchQueue.global(qos: .background).async {
                self.generator.splayTreeSearch(loop: loops, progressBar: self.searchProgressBar)
                print("Number of nodes in the list: \(self.generator.splayTree.getCount())")
            }
        }
    }
    
    @IBAction func onDelete(_ sender: Any) {
        print("Delete")
        if (self.deleteField.text != "") {
            
            deleteProgressBar.progress = 0.0
            deleteProgressBar.isHidden = false
            let loops = Int(deleteField.text!)!
            DispatchQueue.global(qos: .background).async {
                self.generator.splayTreeDelete(loop: loops, progressBar: self.deleteProgressBar)
                print("Number of nodes in Splay tree: \(self.generator.splayTree.getCount())")
            }
        }
    }
}
