//
//  PassengerInfoTableViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 29.04.2024.
//

import UIKit
import CoreData

class PassengerInfoTableViewController: UITableViewController {

    var informations = [String]()
    var seats = [String]()
    let acceptableCharacters = " ABCÇDEFGĞHIİJKLMNOÖPQRSŞTUÜVWXYZabcçdefgğhıijklmnoöpqrsştuüvwxyz"
    
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var firmNameLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        navigationItem.title = "Take Me Away"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        nameTextField.delegate = self
        surnameTextField.delegate = self
    }
    @objc private func dismissKeyboard() {
      view.endEditing(true)
    }
    
    private func setupScreen() {
        nameTextField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        surnameTextField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        firmNameLabel.text = informations[5]
        routeLabel.text = "\(informations[0])  >  \(informations[1])"
        dateLabel.text = "Date: \(informations[2])"
        timeLabel.text = "Time: \(informations[3])"
        seatsLabel.text = "Seats: \(seats.joined(separator: " - "))"
    }

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        if nameTextField.text == "" {
            let alert = UIAlertController(title: "Warning", message: "Please enter a name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",style: .default)
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }else if surnameTextField.text == "" {
            let alert = UIAlertController(title: "Warning", message: "Please enter a surname", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",style: .default)
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }else {
            let nameForSave = nameTextField.text!.prefix(1).uppercased() + nameTextField.text!.lowercased().dropFirst()
            let surnameForSave = surnameTextField.text!.prefix(1).uppercased() + surnameTextField.text!.lowercased().dropFirst()
            
            let newTicket = NSEntityDescription.insertNewObject(forEntityName: "Ticket", into: context)
            newTicket.setValue(nameForSave, forKey: "name")
            newTicket.setValue(surnameForSave, forKey: "surname")
            newTicket.setValue(informations[0], forKey: "from")
            newTicket.setValue(informations[1], forKey: "to")
            newTicket.setValue(informations[2], forKey: "date")
            newTicket.setValue(informations[3], forKey: "time")
            newTicket.setValue(informations[4], forKey: "price")
            newTicket.setValue(informations[5], forKey: "firmname")
            newTicket.setValue(informations[6], forKey: "imagename")
            newTicket.setValue("\(UUID())", forKey: "id")
            newTicket.setValue("\(seats.joined(separator: " - "))", forKey: "seat")
            do {
                try context.save()
            }catch {
                print(error.localizedDescription)
            }
            let myTicketsVC = self.storyboard?.instantiateViewController(withIdentifier: "myTicketsView") as! MyTicketsViewController
            self.navigationController?.pushViewController(myTicketsVC, animated: true)
            
        }
    }
        
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }else {
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section != 3 {
            view.tintColor = .orange
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = .white
            header.textLabel?.textAlignment = .center
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            header.layer.cornerRadius = header.frame.height / 2
            header.layer.masksToBounds = true
        }
    }
}

extension PassengerInfoTableViewController: UITextFieldDelegate {
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let cs = CharacterSet(charactersIn: acceptableCharacters).inverted
            let filtered: String = (string.components(separatedBy: cs) as NSArray).componentsJoined(by: "")
            return (string == filtered)
        }
}
