//
//  SixthViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 26/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

var myIndex = 0

class SixthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var airport = Airport.shared
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airport.airplanes.getCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.15 * table.bounds.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "airplaneCell") as? AirplaneTableViewCell else {
            return UITableViewCell()
        }
        
        let currentAirplaneArray = airport.airplanes.inOrder()
        let airplaneAtRow = currentAirplaneArray[indexPath.row]
        
        cell.number.text = "\(indexPath.row + 1).)"
        cell.code.text = airplaneAtRow.code
        cell.airplaneDescription.text = airplaneAtRow.toString()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "airplaneDetailSegue", sender: self)
        
    }

}
