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
    
    @IBOutlet weak var tomorrowButton: UIButton!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var whenView: UIView!
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var fromView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromPickerView.delegate = self
        fromPickerView.dataSource = self
        toPickerView.delegate = self
        toPickerView.dataSource = self

        loadingSettings()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let num1 = fromPickerView.selectedRow(inComponent: 0)
        let num2 = toPickerView.selectedRow(inComponent: 0)
        print(datePicker.date)
        when = datePicker.date
        
        
        from = cities[num1]
        to = cities[num2]
        print(when.description)
        print(from,to,when)
    }
    @IBAction func todayButtonTapped(_ sender: UIButton) {
        datePicker.date = .now + 10801
    }
    
    @IBAction func tomorrowButtonTapped(_ sender: UIButton) {
        datePicker.date = .now + 86400 + 10801
    }
    
    
    private func loadingSettings() {
        navigationItem.title = "Take Me Away"
        datePicker.date = .now
        datePicker.minimumDate = .now
        mainView.backgroundColor = .black
        whenView.backgroundColor = .orange
        whenView.layer.cornerRadius = whenView.frame.height / 2
        toView.backgroundColor = .orange
        toView.layer.cornerRadius = toView.frame.height / 2
        fromView.backgroundColor = .orange
        fromView.layer.cornerRadius = fromView.frame.height / 2
        profileButton.configuration?.baseForegroundColor = .orange
        toPickerView.tintColor = .white
        searchButton.tintColor = .orange
        todayButton.tintColor = .orange
        tomorrowButton.tintColor = .orange
        searchButton.layer.cornerRadius = searchButton.frame.height / 2
        searchButton.layer.masksToBounds = true
        todayButton.layer.cornerRadius = todayButton.frame.height / 2
        todayButton.layer.masksToBounds = true
        tomorrowButton.layer.cornerRadius = tomorrowButton.frame.height / 2
        tomorrowButton.layer.masksToBounds = true
    }
}
//MARK: - PickerView Methods

extension BuyTicketViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count - 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
        //TODO: Can't be selected same value at the same time by two of picker views. Solve this!
    }
}



