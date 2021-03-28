//
//  Products.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

struct Product: Codable {
    var id: Int
    var cat_id: Int
    var name: String
    var description: String
    var show_count: Int
    var price: Int
    var in_favorite: Bool
    var in_basket: Bool
    var images: [String]?
    
    static func getImageUrl(url: String) -> URL {
        let url = "http://194.4.58.28:9999/\(url)"
        return URL.init(string: url)!
    }
    
   
}
