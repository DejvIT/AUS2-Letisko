//
//  Nineth2ViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 01/11/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class Nineth2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var airport = Airport.shared
    var runway: Runway?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        runway = airport.allRunways.inOrder()[myIndex]
        
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return runway?.departures.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.15 * table.bounds.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "airplaneCell") as? AirplaneTableViewCell else {
            return UITableViewCell()
        }
        
        let departureAtRow = runway!.departures[indexPath.row]
        
        cell.number.text = "\(indexPath.row + 1).)"
        cell.code.text = "Lietadlo: \(departureAtRow.airplane.code)"
        cell.airplaneDescription.text = "Dátum a čas príletu: \(departureAtRow.arrival?.dateToString() ?? "nil"), požiadavka na dráhu: \(departureAtRow.request?.dateToString() ?? "nil"), Odlet: \(departureAtRow.departure?.dateToString() ?? "nil")\nDĺžka dráhy: \(departureAtRow.airplane.minLength)m, Výrobca: \(departureAtRow.airplane.creator)"
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        
        cell.selectedBackgroundView = backgroundView
        return cell
    }
}
