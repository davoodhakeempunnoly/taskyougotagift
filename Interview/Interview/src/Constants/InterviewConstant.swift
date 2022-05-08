//
//  InterviewConstant.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//


import Foundation
import UIKit
struct Screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
struct ListScreenConstants {
    static let userNamePlaceHolder = "User Name"
    static let passwordPlaceHolder = "Password"
}
struct CellHeight {
    static let notificationCellHeight = CGFloat(80)
}
struct ApiConstants {
    static let baseUrl = "https://api.nytimes.com/"
    static let imageBaseUrl = "https://static01.nyt.com/"
    static let newsListEndPoint = "svc/search/v2/articlesearch.json?api-key=5763846de30d489aa867f0711e2b031c&q=dubai&page="
}
