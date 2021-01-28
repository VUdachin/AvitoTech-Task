//
//  AdvertisingModel.swift
//  AvitoTech-task
//
//  Created by Vladimir Udachin on 28.01.2021.
//

import Foundation

struct AdvertisingMessage: Codable {
    let status: String
    let result: AdvertisingModel
}

// MARK: - Result
struct AdvertisingModel: Codable {
    let title, actionTitle, selectedActionTitle: String
    let list: [Banner]
}

// MARK: - List
struct Banner: Codable {
    let id, title: String
    let description: String?
    let icon: Icon
    let price: String
    let isSelected: Bool
    
}

// MARK: - Icon
struct Icon: Codable {
    let the52X52: String

    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}
