//
//  ParseManager.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

class ParseManager {
    static let shared = ParseManager()

    let networkManager = Router(parser: CustomParser())

    private init() {}

    func postMethod<T: Codable>(with url: String = "", parameters: Parameters, completion: @escaping (T?, String?) -> ()) -> Void {
        var urlString = ""
        
        urlString = url
        
        let endpoint = Endpoints.postMethod(url: urlString, parameters: parameters)

        let dispatch = DispatchQueue.global(qos: .utility)

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    completion(nil, error)
                case .success(let value):
                    completion(value, nil)
                }
            }
        }
    }

    func getMethod<T: Codable>(with url: String = "", completion: @escaping (T?, String?) -> ()) -> Void {
    
        let urlString = url

        let endpoint = Endpoints.getMethod(url: urlString)
        

        let dispatch = DispatchQueue.global(qos: .utility)
        

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    completion(nil, error)
                case .success(let value):
                    completion(value, nil)
                }
            }
        }
    }

}
