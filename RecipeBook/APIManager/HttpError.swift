//
//  HttpError.swift
//  APIManager
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

public enum HttpError: Error, Equatable {
    case badRequest
    case serverError
    case unauthorized
    case serviceUnavailable
    case forbidden
    case notFound
    case genericError(rawValue: Int)
}
