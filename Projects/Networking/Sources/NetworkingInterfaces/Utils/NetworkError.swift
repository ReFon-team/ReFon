//
//  NetworkError.swift
//  NetworkingInterfaces
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case invalidResponse
    case dataConversionFailure
}
