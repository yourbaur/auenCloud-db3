//
//  Result.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

public enum Result<T: Decodable> {
    case failure(String)
    case success(T)
}

class  GeneralResult<T: Decodable>: Decodable {
    let result: T
    let message: String
    let status_code: Int
}
