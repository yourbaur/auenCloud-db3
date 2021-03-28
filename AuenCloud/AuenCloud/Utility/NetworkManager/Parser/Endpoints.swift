//
//  Endpoints.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//


import Foundation
enum Endpoints: EndpointType {
    
    case postMethod(url: String, parameters: Parameters)
    case getMethod(url: String)
    
    var baseUrl: URL {
        return URL(string: "http://172.16.0.2:3000/api/")!
    }
    
    var path: String {
        switch self {
        case .postMethod(let url, _):
            return url
        case .getMethod(let url):
            return url
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .postMethod(_, _):
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .postMethod(_, let parameters):
            return .multipartFormData(bodyParameters: parameters, urlParameters: nil, additionalHeader: nil)
        case .getMethod(_):
            return .multipartFormData(bodyParameters: nil, urlParameters: nil, additionalHeader: nil)
        }
    }
}
