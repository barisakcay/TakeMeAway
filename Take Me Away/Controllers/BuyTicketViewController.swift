//
//  ViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 22.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    var from = ""
    var to = ""
    var when = Date()

    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        fromPickerView.delegate = self
        fromPickerView.dataSource = self
        toPickerView.delegate = self
        toPickerView.dataSource = self

        navigationItem.title = "Take Me Away"
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        var num1 = fromPickerView.selectedRow(inComponent: 0)
        var num2 = toPickerView.selectedRow(inComponent: 0)
        when = datePicker.date
        
        from = cities[num1]
        to = cities[num2]
        when = when + 10801
        print(when.description)
        print(from,to,when)
    }
    
    
}

extension BuyTicketViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cities[row]
    }
}



