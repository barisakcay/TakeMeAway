//
//  MyTicketsViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 22.04.2024.
//

import UIKit
import CoreData

class MyTicketsViewController: UIViewController {
    
    var tickets = [Ticket]() {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Take Me Away"
        let nib = UINib(nibName: MyTicketsCell().identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MyTicketsCell().identifier)
        getTickets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTickets()
    }
}

//MARK: - Table View Methods

extension MyTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !tickets.isEmpty {
            emptyView.isHidden = true
            return tickets.count
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTicketsCell().identifier, for: indexPath) as? MyTicketsCell else {return UITableViewCell()}
        cell.configure(tickets: tickets, row: indexPath.row)
        return cell
    }
}

//MARK: - Fetching Ticket Data

extension MyTicketsViewController {
    
    private func getTickets() {
        let fetchRequest = Ticket.fetchRequest()
        
        do {
            tickets = try context.fetch(fetchRequest)
        }catch {
            print(error.localizedDescription)
        }
    }
    
}

