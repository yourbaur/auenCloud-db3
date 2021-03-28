//
//  GeneralResponse.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

class GeneralResponse<T: Codable>: Codable {
    let response: T
}
