//
//  SeatsViewController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 27.04.2024.
//

import UIKit

class SeatsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var buyButton: UIButton!
    var seatNumbers = [Int:String]()
    var informations = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(informations[0]) to \(informations[1]) \(informations[2]) - \(informations[3])"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: SeatCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SeatCell.identifier)
        collectionView.collectionViewLayout = UICollectionViewLayout()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 200
        collectionView.collectionViewLayout = layout
        collectionView.allowsMultipleSelection = true
        seatNumberFill()
        buyButton.layer.cornerRadius = buyButton.frame.height / 2
        buyButton.layer.masksToBounds = true
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        guard let seats = collectionView.indexPathsForSelectedItems else {return}
        if seats.isEmpty {
            let alert = UIAlertController(title: "Warning", message: "Please select seat", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",style: .default)
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
        }else {
            for i in 0...seats.count - 1 {
                print(seatNumbers[seats[i].last!]!)
                print(informations)
                informations.append(seatNumbers[seats[i].last!]!)
            }
            print(informations)
            let passengerInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "PassengerInfoVC") as! PassengerInfoViewController
            passengerInfoVC.informations = informations
            self.navigationController?.pushViewController(passengerInfoVC, animated: true)
        }
    }
}

extension SeatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        55
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as? SeatCell else {return UICollectionViewCell()}
        cell.configure(seatNum: seatNumbers[indexPath.row]!)
        if indexPath.row == 2 || indexPath.row == 7 || indexPath.row == 12 || indexPath.row == 17 || indexPath.row == 22 || indexPath.row == 27 || indexPath.row == 32 || indexPath.row == 37 || indexPath.row == 42 || indexPath.row == 47 || indexPath.row == 52 {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "mainSeatCell", for: indexPath)
            return cell2
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 60, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCell {
            cell.selectedConfigure(num: indexPath.row)
            
            if collectionView.indexPathsForSelectedItems?.count == 5 {
                let alert = UIAlertController(title: "Notice", message: "You have reached the maximum number of selectable seats", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK",style: .default)
                alert.addAction(action)
                present(alert,animated: true,completion: nil)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCell {
            cell.deSelectedConfigure(num:indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return collectionView.indexPathsForSelectedItems!.count <= 4
    }
    
}

extension SeatsViewController {
    
    func seatNumberFill() {
        var j = 0
        var k = 2
        for i in 0...55 {
            if  i == k {
                k += 5
                seatNumbers[i] = "999"
            }else {
                j += 1
                seatNumbers[i] = "\(j)"
            }
        }
    }
}
