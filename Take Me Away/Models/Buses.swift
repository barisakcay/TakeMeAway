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

struct Bus: Decodable {
    let name: String?
    let date: String?
    let time: String?
    let from: String?
    let to: String?
}
