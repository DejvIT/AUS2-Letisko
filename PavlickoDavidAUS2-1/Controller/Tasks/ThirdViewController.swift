//
//  ThirdViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 27/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var airport = Airport.shared
    
    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var creator: UILabel!
    @IBOutlet weak var arrival: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var priority: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSearch(_ sender: UIButton) {
        
        let airplane = Airplane(code: codeField.text!)
        let node = airport.airplanes.search(airplane, delete: false)
        
        if (node != nil) {
            code.text = node?.value.code
            creator.text = node?.value.creator
            arrival.text = "\((node?.value.arrivalTime)!)"
            departure.text = "\((node?.value.departureTime)!)"
            priority.text = "\((node?.value.priority)!)"
        } else {
            code.text = "Lietadlo sa nenašlo"
            creator.text = ""
            arrival.text = ""
            departure.text = ""
            priority.text = ""
        }
    }
    
}
