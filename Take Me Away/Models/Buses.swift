//
//  Buses.swift
//  Take Me Away
//
//  Created by Baris Akcay on 23.04.2024.
//

import Foundation

struct Buses: Decodable{
    let buses: [Bus]
}

struct Bus: Decodable{
    let name: String?
    let time: String?
    let imageName: String?
    let price: String?
}
