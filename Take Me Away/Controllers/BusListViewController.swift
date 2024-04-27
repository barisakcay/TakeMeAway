//
//  BusListViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 25.04.2024.
//

import UIKit

class BusListViewController: UIViewController {
    
    var buses = [Bus]()
    var otherThings = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: BusListCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BusListCell.identifier)
        tableView.separatorColor = .orange
        tableView.separatorStyle = .singleLine
        fetchBusData()
    }
}

extension BusListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BusListCell.identifier, for: indexPath) as? BusListCell else {return UITableViewCell()}
        cell.configure(model: buses[indexPath.row], from: otherThings[0], to: otherThings[1], date: otherThings[2])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - Fetching Bus Data

extension BusListViewController {
    
    func fetchBusData() {
        let jsonData = loadJson(filename: "Buses")
        if let data = jsonData {
            if let busObj = parse(jsonData: data) {
                for i in busObj.buses {
                    buses.append(i)
                }
            }
        }
    }
}
