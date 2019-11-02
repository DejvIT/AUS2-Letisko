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
    
    @IBAction func onImport(_ sender: UIButton) {
        importCSV()
    }
    
    @IBAction func onExport(_ sender: UIButton) {
        
        for airplane in airport.airplanes.levelOrder() {
            importExport.write(line: airplane.toString())
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
    
    func importCSV() {

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path

        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(vc, animated: true, completion: nil)
        
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
    fileprivate var path: String!
    fileprivate var pathURL: String!
    
    fileprivate var _fileManager: FileManager = FileManager.default
    fileprivate var _fileHandle: FileHandle?
    fileprivate var _scanner: Scanner?
    
    init() {
        guard let path = Bundle.main.path(forResource: filename, ofType: "csv") else {
            return
        }
        
        self.path = path
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
    
    func prepareForImport() {
        let csvFile = try! String(contentsOfFile: self.pathURL, encoding: String.Encoding.utf8)
        self._scanner = Scanner(string: csvFile)
    }
    
    func write(line: String) {
        let output = line
        _fileHandle?.write(output.data(using: String.Encoding.utf8)!)
    }
    
    func readCSV(newLine: @escaping ([String]?) -> ()) {
        while let str: String = scanner.scanUpToString("\n") {
            let components = str.components(separatedBy: ";")
            newLine(components)
        }
    }
}
