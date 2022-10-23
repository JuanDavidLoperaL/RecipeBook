//
//  APIManager.swift
//  APIManager
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

final class APIManager {
    func request<T: Decodable>(with scheme: String, host: String, path: String, queryItems: [URLQueryItem], body: [String: Any]? = nil, method: HttpMethod = .get, completion: @escaping (Result<T, HttpError>) -> Void) {
        let sessionRequest = URLSession(configuration: .default)
        guard let url: URL = getUrl(scheme: scheme, host: host, path: path, queryItems: queryItems) else {
            completion(.failure(.badRequest))
            return
        }
        var request = URLRequest(url: url)
        request.httpBody = convertJsonForData(json: body)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        sessionRequest.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil else {
                completion(.failure(.badRequest))
                return
            }
            guard let httpUrlResponse: HTTPURLResponse = response as? HTTPURLResponse else {
                completion(.failure(.badRequest))
                return
            }
            let decoder:JSONDecoder = JSONDecoder()
            self?.requestLog(data: data, response: httpUrlResponse, error: error)
            if httpUrlResponse.statusCode >= 200 && httpUrlResponse.statusCode < 300 {
                guard let data: Data = data else {
                    completion(.failure(.badRequest))
                    return
                }
                guard let objectDecodable = try? decoder.decode(T.self, from: data) else {
                    completion(.failure(.badRequest))
                    return
                }
                completion(.success(objectDecodable))
            } else {
                switch httpUrlResponse.statusCode {
                case 400:
                    completion(.failure(.badRequest))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 404:
                    completion(.failure(.notFound))
                case 500:
                    completion(.failure(.serverError))
                case 503:
                    completion(.failure(.serviceUnavailable))
                default:
                    completion(.failure(.genericError(rawValue: httpUrlResponse.statusCode)))
                }
            }
        }.resume()
    }
}

// MARK: - Private Function
extension APIManager {
    private func convertJsonForData(json: [String: Any]?) -> Data? {
        do {
            if let json = json {
                let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                return data
            }
        } catch let parsingError {
            debugPrint("Error", parsingError)
        }
        return nil
    }
    
    private func getUrl(scheme: String, host: String, path: String, queryItems: [URLQueryItem]) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        urlComponent.queryItems = queryItems
        return urlComponent.url
    }
    
    private func requestLog(data: Data?, response: HTTPURLResponse?, error: Error?) {
        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        
        var responseLog = "\n<---------- IN ----------\n"
        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
        }
        
        if let statusCode =  response?.statusCode {
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
        }
        if let host = components?.host {
            responseLog += "Host: \(host)\n"
        }
        for (key,value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
        }
        if let body = data {
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? ""
            responseLog += "\n\(bodyString)\n"
        }
        if let error = error {
            responseLog += "\nError: \(error.localizedDescription)\n"
        }
        
        responseLog += "<------------------------\n"
        debugPrint(responseLog)
    }
}


