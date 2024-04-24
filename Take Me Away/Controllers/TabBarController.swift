//
//  TabBarController.swift
//  Take Me Away
//
//  Created by Baris Akcay on 24.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.items![0].title = "Buy Ticket"
        tabBar.items![0].image = UIImage(systemName: "magnifyingglass.circle.fill")
        tabBar.items![1].title = "My Tickets"
        tabBar.items![1].image = UIImage(systemName: "ticket.fill")
        
    }
    

}
