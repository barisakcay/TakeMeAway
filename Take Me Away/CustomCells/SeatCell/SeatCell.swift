//
//  SeatCell.swift
//  Take Me Away
//
//  Created by Baris Akcay on 27.04.2024.
//

import UIKit

class SeatCell: UICollectionViewCell {
    
    static let identifier = "SeatCell"
    
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var seatImageView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(seatNum: String) {
        cellView.backgroundColor = .black
        seatImageView.image = UIImage(systemName: "carseat.left")
        seatLabel.textColor = .orange
        seatLabel.text = seatNum
        
    }
    
    func selectedConfigure(num: Int) {
            seatImageView.image = UIImage(systemName: "carseat.left.fill")
            
        
    }
    
    func deSelectedConfigure(num: Int) {

            seatImageView.image = UIImage(systemName: "carseat.left")
            
        
    }
}
