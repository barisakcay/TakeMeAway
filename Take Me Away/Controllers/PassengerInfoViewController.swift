//
//  PassengerInfoViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 28.04.2024.
//

import UIKit

class PassengerInfoViewController: UIViewController {
    
    var informations = [String]()
    

    @IBOutlet weak var routeInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSettings()
        print(informations)

    }
    
    private func loadingSettings() {
        navigationItem.title = "Take Me Away"
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
        doneButton.layer.masksToBounds = true
        nameLabel.text = "Name"
        nameLabel.backgroundColor = .orange
        nameLabel.layer.cornerRadius = nameLabel.frame.height / 2
        nameLabel.layer.masksToBounds = true
        surnameLabel.text = "Surname"
        surnameLabel.backgroundColor = .orange
        surnameLabel.layer.cornerRadius = surnameLabel.frame.height / 2
        surnameLabel.layer.masksToBounds = true
        
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
    }
}
