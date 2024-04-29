//
//  MyTicketsCell.swift
//  Take Me Away
//
//  Created by Baris Akcay on 29.04.2024.
//

import UIKit

class MyTicketsCell: UITableViewCell {
    
    let identifier = "MyTicketsCell"

    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var firmImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(tickets: [Ticket], row: Int) {
        nameSurnameLabel.text = "Name - Surname : \(tickets[row].name!)" + " " + "\(tickets[row].surname!)"
        dateTimeLabel.text = "Date - Time : \(tickets[row].date!)" + "\(tickets[row].time!)"
        routeLabel.text = "Route : \(tickets[row].from!) > \(tickets[row].to!)"
        idLabel.text = "ID: \(tickets[row].id!)"
        seatsLabel.text = "Seats: \(tickets[row].seat!)"
        firmImageView.image = UIImage(named: tickets[row].imagename!)
    }
}
