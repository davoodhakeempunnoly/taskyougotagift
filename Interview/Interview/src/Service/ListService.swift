//
//  ListService.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import Foundation
enum GetListService {
    case newsList(_ page: String)
}
extension GetListService: Service {
    var baseURL: String {
        return ApiConstants.baseUrl
    }
    var path: String {
        switch self {
        case .newsList(let page):
            return ApiConstants.newsListEndPoint + page
        }
    }
    
    var parameters: [String : Any]? {
        return [:]
    }
    
    var method: ServiceMethod {
        .get
    }
}
