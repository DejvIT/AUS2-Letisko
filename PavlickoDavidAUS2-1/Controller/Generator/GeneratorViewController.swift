//
//  ViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 07/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class GeneratorViewController: UIViewController {

    var airport = Airport.shared
    let importExport = ImportExport()
    
    @IBOutlet weak var runwaysButton: UIButton!
    @IBOutlet weak var airplanesButton: UIButton!
    @IBOutlet weak var launchesButton: UIButton!
    @IBOutlet weak var importButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DEBUG")
    }
    
    @IBAction func onImport(_ sender: UIButton) {
        importExport.prepareForImport()
        
        var write = false
        var section = ""
        let lokalSplayAirplanes: SplayTree<Airplane> = SplayTree<Airplane>(Airplane.comparator)
        
        importExport.read { [weak self] component in
            if let component = component {
                
                if ((component[0] == "TIME")) {
                    self!.airport._time = DateTime(day: Int(component[1])!, month: Int(component[2])!, year: Int(component[3])!, hour: Int(component[4])!, minute: Int(component[5])!)
                }
                
                if ((component[0] == "AIRPLANES" || section == "AIRPLANES")) {
                    
                    if (component[0] == "AIRPLANESOUT") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "AIRPLANES"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let airplane = Airplane(creator: component[0], code: component[1], minLength: Int(component[2])!, arrivalTime: DateTime(day: Int(component[3])!, month: Int(component[4])!, year: Int(component[5])!, hour: Int(component[6])!, minute: Int(component[7])!), departureRequest: DateTime(day: Int(component[8])!, month: Int(component[9])!, year: Int(component[10])!, hour: Int(component[11])!, minute: Int(component[12])!), departureTime: DateTime(day: Int(component[13])!, month: Int(component[14])!, year: Int(component[15])!, hour: Int(component[16])!, minute: Int(component[17])!), priority: component[18] == "-1" ? nil : Int(component[18])!)
                        
                        _ = self!.airport.airplanes.insert(airplane)
                        _ = lokalSplayAirplanes.insert(airplane)
                    }
                    
                    if (section != "") {
                        write = true
                    }
                }
                
                if ((component[0] == "AIRPLANESOUT" || section == "AIRPLANESOUT")) {
                    
                    if (component[0] == "ARRIVALS") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "AIRPLANESOUT"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let airplane = Airplane(creator: component[0], code: component[1], minLength: Int(component[2])!, arrivalTime: DateTime(day: Int(component[3])!, month: Int(component[4])!, year: Int(component[5])!, hour: Int(component[6])!, minute: Int(component[7])!), departureRequest: DateTime(day: Int(component[8])!, month: Int(component[9])!, year: Int(component[10])!, hour: Int(component[11])!, minute: Int(component[12])!), departureTime: DateTime(day: Int(component[13])!, month: Int(component[14])!, year: Int(component[15])!, hour: Int(component[16])!, minute: Int(component[17])!), priority: component[18] == "-1" ? nil : Int(component[18])!)
                        
                        _ = self!.airport.airplanesInAir.insert(airplane)
                        _ = lokalSplayAirplanes.insert(airplane)
                    }
                    
                    if (section != "") {
                        write = true
                    }
                }
                
                if ((component[0] == "ARRIVALS" || section == "ARRIVALS")) {
                    
                    if (component[0] == "RUNWAYTYPES") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "ARRIVALS"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let airplane = lokalSplayAirplanes.search(Airplane(code: component[0]), delete: false, closest: false)?.value
                        _ = self!.airport.arrivals.append(Arrival(airplane!, component[1]))
                    }
                    
                    if (section != "") {
                        write = true
                    } else {
                        write = false
                    }
                }
                
                if ((component[0] == "RUNWAYTYPES" || section == "RUNWAYTYPES")) {
                    
                    if (component[0] == "RUNWAYS") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "RUNWAYTYPES"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let runwayType = RunwayType(Int(component[0])!)
                        _ = self!.airport.runwayTypes.insert(runwayType)
                    }
                    
                    if (section != "") {
                        write = true
                    } else {
                        write = false
                    }
                }
                
                if ((component[0] == "RUNWAYS" || section == "RUNWAYS")) {
                    
                    if (component[0] == "WAITINGFORRUNWAYS") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "RUNWAYS"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let findingType = RunwayType(Int(component[1])!)
                        let runwayType = self!.airport.runwayTypes.search(findingType, delete: false, closest: false)?.value
                        let runway = Runway(Int(component[0])!, runwayType!)
                        
                        let airplane = lokalSplayAirplanes.search(Airplane(code: component[2]), delete: false, closest: false)?.value
                        if airplane != nil {
                            runway._airplane = airplane
                        }
                        
                        _ = self!.airport.allRunways.insert(runway)
                        runwayType?.runways.append(runway)
                    }
                    
                    if (section != "") {
                        write = true
                    } else {
                        write = false
                    }
                }
                
                if ((component[0] == "WAITINGFORRUNWAYS" || section == "WAITINGFORRUNWAYS")) {
                    
                    if (component[0] == "RUNWAYSWAITINGS") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "WAITINGFORRUNWAYS"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let airplane = lokalSplayAirplanes.search(Airplane(code: component[0]), delete: false, closest: false)?.value
                        
                        _ = self!.airport.waitingForRunway.insert(airplane!)
                    }
                    
                    if (section != "") {
                        write = true
                    }
                }
                
                if ((component[0] == "RUNWAYSWAITINGS" || section == "RUNWAYSWAITINGS")) {
                    
                    if (component[0] == "DEPARTURES") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "RUNWAYSWAITINGS"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let runwayType = self!.airport.runwayTypes.search(RunwayType(Int(component[0])!), delete: false, closest: false)?.value
                        let airplane = lokalSplayAirplanes.search(Airplane(code: component[1]), delete: false, closest: false)?.value
                        
                        _ = runwayType?.waitingAirplanes.insert(airplane!)
                        airplane?._pairingHeapNode = runwayType?.priorityWaiting.insert(airplane!)
                    }
                    
                    if (section != "") {
                        write = true
                    }
                }
                
                if ((component[0] == "DEPARTURES" || section == "DEPARTURES")) {
                    
                    if (component[0] == "") {
                        
                        section = ""
                        write = false
                        
                    } else {

                        section = "DEPARTURES"
                        print(component)
                    }
                    
                    if (write) {
                        
                        let airplane = lokalSplayAirplanes.search(Airplane(code: component[0]), delete: false, closest: false)?.value
                        let runway = self!.airport.allRunways.search(Runway(Int(component[2])!), delete: false, closest: false)?.value
                        
                        runway?._departures.append(Departure(airplane!, component[1], runway!.id))
                    }
                    
                    if (section != "") {
                        write = true
                    }
                }
            }
        }
    }
    
    @IBAction func onExport(_ sender: UIButton) {
        
        importExport.prepareForExport()
        
        importExport.write(line: "TIME;\(airport.time.toExport())\n")
        
        importExport.write(line: "AIRPLANES\n")
        for airplane in airport.airplanes.levelOrder() {
            importExport.write(line: airplane.toExport())
        }
        
        importExport.write(line: "AIRPLANESOUT\n")
        for airplaneOut in airport.airplanesInAir.levelOrder() {
            importExport.write(line: airplaneOut.toExport())
        }
        
        importExport.write(line: "ARRIVALS\n")
        for arrival in airport.arrivals {
            importExport.write(line: arrival.toExport())
        }
        
        importExport.write(line: "RUNWAYTYPES\n")
        for runwayType in airport.runwayTypes.levelOrder() {
            importExport.write(line: runwayType.toExport())
        }

        importExport.write(line: "RUNWAYS\n")
        for runway in airport.allRunways.levelOrder() {
            importExport.write(line: runway.toExport())
        }

        importExport.write(line: "WAITINGFORRUNWAYS\n")
        for airplane in airport.waitingForRunway.levelOrder() {
            importExport.write(line: airplane.code + "\n")
        }

        importExport.write(line: "RUNWAYSWAITINGS\n")
        for runwayType in airport.runwayTypes.levelOrder() {
            for airplane in runwayType.waitingAirplanes.levelOrder() {
                importExport.write(line: "\(runwayType.length);\(airplane.code)\n")
            }
        }

        importExport.write(line: "DEPARTURES\n")
        for runway in airport.allRunways.levelOrder() {
            for departure in runway.departures {
                importExport.write(line: departure.toExport())
            }
        }
    }
    
    func exportCSV() {
        
        let fileName = "Airplanes.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        var csvText = "Vsetko co vieme o lietadle\n"
        
        if (airport.airplanes.getCount() > 0) {

            for airplane in airport.airplanes.levelOrder() {
                let newLine = "\(String(airplane.toString()))\n"
                csvText.append(contentsOf: newLine)
            }
            
            do {
                try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to create file")
                print("\(error)")
            }
            
            let vc = UIActivityViewController(activityItems: [path!], applicationActivities: [])
            present(vc, animated: true, completion: nil)
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

final class ImportExport {
    
    fileprivate let filename: String = "export"
    fileprivate var pathURL: String!
    
    fileprivate var _fileManager: FileManager = FileManager.default
    fileprivate var _fileHandle: FileHandle?
    fileprivate var _scanner: Scanner?
    
    init() {
        self.pathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
    }
    
    var fileManager: FileManager {
        get {
            return self._fileManager
        }
    }
    
    var fileHandle: FileHandle {
        get {
            return self._fileHandle!
        }
    }
    
    var scanner: Scanner {
        get {
            return self._scanner!
        }
    }
}

extension ImportExport {
    
    func prepareForExport() {
        
        do {
            try _fileManager.removeItem(atPath: pathURL)
        } catch let error {
            debugPrint("\(error)")
        }
        
        _fileManager.createFile(atPath: pathURL, contents: nil, attributes: nil)
        _fileHandle = FileHandle(forUpdatingAtPath: pathURL)
        _fileHandle?.seekToEndOfFile()
    }
    
    func write(line: String) {
        let output = line
        _fileHandle?.write(output.data(using: String.Encoding.utf8)!)
    }
    
    func prepareForImport() {
        let csvFile = try! String(contentsOfFile: self.pathURL, encoding: String.Encoding.utf8)
        self._scanner = Scanner(string: csvFile)
    }
    
    func read(newLine: @escaping ([String]?) -> ()) {
        while let str: String = scanner.scanUpToString("\n") {
            let components = str.components(separatedBy: ";")
            newLine(components)
        }
    }
}
