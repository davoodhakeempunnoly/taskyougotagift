//
//  BaseService.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import Foundation
enum ServiceMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete  = "DELETE"
}
protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: ServiceMethod { get }
}
extension Service {
    public var urlRequest: URLRequest {
         guard let url = self.url else {
             fatalError("URL could not be built")
         }
         var request = URLRequest(url: url)
         request.httpMethod = method.rawValue
        if request.httpMethod == ServiceMethod.post.rawValue {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
         return request
     }

     private var url: URL? {
         return URL(string: baseURL + path)
     }
}
