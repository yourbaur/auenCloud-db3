//
//  Track.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
 
struct Rows:Codable {
    let rows:[[String?]]?
}
struct Track:Codable {
    let FIRST_NAME:String?
    let LAST_NAME:String?
    let TOKEN:String?
    let SINGER:String?
    let SONG:String?
    let LINK:String?
    let ALBUM:String?
    let GENRE:String?
}
