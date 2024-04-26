//
//  BusListViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 25.04.2024.
//

import UIKit

class BusListViewController: UIViewController {

    var buses = [Bus]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buses.append(Bus(name: "KamilKoç", date: "01.01.2023", time: "19.50", imageName: "kamilkoc", from: "Burdur", to: "Adana"))
        buses.append(Bus(name: "Pamukkale", date: "01.01.2023", time: "19.50", imageName: "pamukkale", from: "Burdur", to: "Adana"))
        buses.append(Bus(name: "Varan", date: "01.01.2023", time: "19.50", imageName: "varan", from: "Burdur", to: "Adana"))
        navigationController?.navigationItem.backBarButtonItem?.title = "Go Back"

        let nib = UINib(nibName: BusListCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BusListCell.identifier)
        
        tableView.separatorColor = .orange
        tableView.separatorStyle = .singleLine
        
    }
}
extension BusListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BusListCell.identifier, for: indexPath) as? BusListCell else {return UITableViewCell()}
        cell.configure(model: buses[indexPath.row], from: "Burdur", to: "Antalya", date: "01.01.2025")
        return cell
    }
    
    
}

