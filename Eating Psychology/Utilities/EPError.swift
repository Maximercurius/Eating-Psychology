//
//  EPErrors.swift
//  Eating Psychology
//
//  Created by Makarov_Maxim on 14.10.2022.
//

import Foundation

enum EPError: String, Error {
    case unableToCoplete = "Unable to complete request"
    case invalidResponse = "Invalid response from server"
    case invalidData = "Data is invalid"
}
