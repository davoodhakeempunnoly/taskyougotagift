//
//  StringExtensions.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//


import Foundation

extension String {
    func changeDate(_ inputFormat: String, _ outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = inputFormat
        let convertedDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        let date = dateFormatter.string(from: convertedDate!)
        return date
    }
}
