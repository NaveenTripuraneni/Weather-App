//
//  SearchResultModel.swift
//  Weather
//
//  Created by Naveen Chowdary on 05/05/23.
//

import Foundation

struct SearchResultModel: Codable {
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
}
