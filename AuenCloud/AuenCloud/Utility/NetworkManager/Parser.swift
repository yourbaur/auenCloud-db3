//
//  Parser.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

public protocol Parser {
    func parse<T: Decodable>(data: Data?, response: URLResponse?, error: Error?) -> Result<T>
    
}

public class DefaultParserImpl: Parser {
    public init() {}
    
    public func parse<T>(data: Data?, response: URLResponse?, error: Error?) -> Result<T> where T : Decodable {
        if let error = error {
            return .failure(error.localizedDescription)
        }
        guard let response = response as? HTTPURLResponse else { return .failure("Response is not in HTTPResponse format") }
        switch response.statusCode {
        case 200...499:
            guard let data = data else { return .failure(NetworkResponse.noData.rawValue) }


            checkForJson(data)

            return decode(data)
        case 300...399:
            return .failure(NetworkResponse.redirect.rawValue)
        case 400...499:
            return .failure(NetworkResponse.authenticationError.rawValue)
            
        case 500...501:
            return .failure(NetworkResponse.internalServerError.rawValue)
            
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
            
        default:
            return .failure(NetworkResponse.failed.rawValue)
            
        }
    }

    private func decode<T: Decodable>(_ data: Data) -> Result<T> {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(Response<T>.self, from: data)
            return checkResponse(response)
        } catch {
            return .failure(error.localizedDescription)
        }
    }

    private func checkResponse<T: Decodable>(_ response: Response<T>) -> Result<T> {
        if let result = response.result {
            return Result.success(result)
        } else {
            print("Response result:", response.result as Any)
            return Result.failure(response.message)
        }
    }

    private func checkForJson(_ data: Data) -> Void {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        } catch {
            print("Error json: ", error.localizedDescription)
        }
    }
}
