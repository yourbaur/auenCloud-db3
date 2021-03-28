//
//  Response.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation


class Response<T: Decodable>: Decodable {
    let status_code: Int
    let message: String
    let result: T?
}
