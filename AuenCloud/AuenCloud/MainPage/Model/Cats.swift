//
//  Cats.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation



struct Cats: Codable {
    var id: Int
    var parent_id: Int
    var color: String?
    var image: String?
    var name: String
    var products: [Product]?
    
}
