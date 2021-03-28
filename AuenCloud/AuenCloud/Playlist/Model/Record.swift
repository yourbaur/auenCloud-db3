//
//  Record.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

struct Record: Codable {
    var id: Int
    var playlist_id: Int?
    var title: String
    var image: String?
    var play_time: String?
    var url: String?
    var created_at: String?
    var updated_at: String?
    var is_new: Bool?
    var time: String?
    var in_favourite: Bool?
    var model_type: String?

}
