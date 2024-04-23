//
//  ViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 22.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    var myName: String = ""
    var myDate: String = ""
    var myTime: String = ""
    var from: String = ""
    var to: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Buy Ticket"
        takeAllOfThem()
        print(myName,myDate,myTime,from,to)        
        takeAllOfThem2()
        print(myName,myDate,myTime,from,to)
    }
}

//MARK: - Buses fetching data

extension BuyTicketViewController {
    
    func loadJson(filename fileName: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                let fileUrl = URL(filePath: filePath)
                let data = try Data(contentsOf: fileUrl)
                print(data)
                return data
            }
        }catch {
            print("loadJson\(error.localizedDescription)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> Buses? {
        do {
            let decodedData = try JSONDecoder().decode(Buses.self, from: jsonData)
            return decodedData
        }catch {
            print("parse\(error.localizedDescription)")
        }
    return nil
    }
    
    func takeAllOfThem() {
        let jsonData = loadJson(filename: "Buses")
        if let data = jsonData {
            if let busObj = parse(jsonData: data) {
                myName = busObj.buses[0].name!
                myTime = busObj.buses[0].time!
            }
        }
    }
    func takeAllOfThem2() {
        let jsonData = loadJson(filename: "Buses")
        if let data = jsonData {
            if let busObj = parse(jsonData: data) {
                myName = busObj.buses[1].name!
                myTime = busObj.buses[1].time!
            }
        }
    }
}

