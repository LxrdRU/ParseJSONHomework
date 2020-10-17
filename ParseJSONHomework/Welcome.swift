//
//  Valute.swift
//  ParseJSONHomework
//
//  Created by Andrey Markov on 2020-10-14.
//

import Foundation


struct Welcome: Codable {
    let Date:String?
    let Valute: [String: Valute]?
}

// MARK: - Valute
struct Valute: Codable {
    let Name: String?
    let Value, Previous: Double?

}
