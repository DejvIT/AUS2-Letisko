//
//  SeventhViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 31/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class SeventhViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var idField: UITextField!
    
    var airplanes: [Airplane] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func onShow(_ sender: UIButton) {
        
        if (idField.text != "") {
            
            let runway = airport.allRunways.search(Runway(Int(idField.text!)!), delete: false, closest: false)?.value
            
            if runway != nil {
                airplanes = (runway?.type!.waitingAirplanes.inOrder())!
            } else {
                airplanes = []
            }
            
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airplanes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.2 * table.bounds.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "airplaneCell") as? AirplaneTableViewCell else {
            return UITableViewCell()
        }
        
        let airplaneAtRow = airplanes[indexPath.row]
        
        cell.number.text = "\(indexPath.row + 1).)"
        cell.code.text = airplaneAtRow.code
        cell.airplaneDescription.text = airplaneAtRow.toString()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        
        cell.selectedBackgroundView = backgroundView
        return cell
    }

}
