//
//  BusListCell.swift
//  Take Me Away
//
//  Created by Baris Akcay on 25.04.2024.
//

import UIKit

class BusListCell: UITableViewCell {
    
    static let identifier = "BusListCell"
    
    @IBOutlet weak var firmLogoView: UIImageView!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(model: Bus, from: String?, to: String?, date: String?) {
        if let firmLogoName = model.imageName,
           let time = model.time,
           let from = from,
           let to = to,
           let _ = date {
            firmLogoView.image = UIImage(named: firmLogoName)
            routeLabel.text = "\(from) > \(to)"
            timeLabel.text = time
            priceLabel.text = "130 ₺"
        }
    }
}
