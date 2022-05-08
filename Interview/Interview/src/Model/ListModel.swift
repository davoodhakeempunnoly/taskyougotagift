//
//  ListModel.swift
//  AnyWhere iOS
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import Foundation

struct ListResponseModel: Codable {
    var status: String?
    var copyright: String?
    var response: ResponseModel?
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case response
    }
}
struct ResponseModel: Codable {
    var docs: [DocsModel]?
    enum CodingKeys: String, CodingKey {
        case docs
    }
}
struct DocsModel: Codable {
    var snippet: String?
    var pub_date: String?
    var headline: HeadLineModel?
    var multimedia: [MultiMediaModel]?
    enum CodingKeys: String, CodingKey {
        case snippet
        case pub_date
        case multimedia
        case headline
    }
}
struct MultiMediaModel: Codable {
    var url: String?
    enum CodingKeys: String, CodingKey {
        case url
    }
}
struct HeadLineModel: Codable {
    var main: String?
    enum CodingKeys: String, CodingKey {
        case main
    }
}
