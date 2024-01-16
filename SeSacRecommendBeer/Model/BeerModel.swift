//
//  BeerModel.swift
//  SeSacRecommendBeer
//
//  Created by hwijinjeong on 1/16/24.
//

import Foundation

struct Beer: Codable {
    let id: Int
    let name: String
    let description: String
    let image_url: String
}
