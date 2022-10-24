//
//  APIManager.swift
//  APIManager
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

public final class APIManager {
    
    public init() {}
    
    public func request<T: Decodable>(with scheme: String, host: String, path: String, queryItems: [URLQueryItem] = [URLQueryItem](), body: [String: Any]? = nil, method: HttpMethod = .get, completion: @escaping (Result<T, HttpError>) -> Void) {
        let sessionRequest = URLSession(configuration: .default)
        guard let url: URL = getUrl(scheme: scheme, host: host, path: path, queryItems: queryItems) else {
            completion(.failure(.badRequest))
            return
        }
        var request = URLRequest(url: url)
        request.httpBody = convertJsonForData(json: body)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestLog(request: request)
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
            self?.responseLog(request: request, data: data, response: httpUrlResponse)
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
private extension APIManager {
    func convertJsonForData(json: [String: Any]?) -> Data? {
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
    
    func getUrl(scheme: String, host: String, path: String, queryItems: [URLQueryItem]) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        urlComponent.queryItems = addTokenInRequest(currentQueryItems: queryItems)
        return urlComponent.url
    }
    
    func addTokenInRequest(currentQueryItems: [URLQueryItem]) -> [URLQueryItem] {
        guard let apiKey: String = Bundle.main.infoDictionary?["APIToken"] as? String else {
            return currentQueryItems.isEmpty ? [URLQueryItem]() : currentQueryItems
        }
        let tokenQuery: URLQueryItem = URLQueryItem(name: "apiKey", value: apiKey)
        var newQueryItems: [URLQueryItem] = currentQueryItems.isEmpty ? [URLQueryItem]() : currentQueryItems
        newQueryItems.append(tokenQuery)
        return newQueryItems
    }
    
    func requestLog(request: URLRequest) {
        print("-- 🚀 Request Started  🚀 -- ")
        print("URL: \(request.url?.absoluteString ?? "Not URL detected")")
        print("Http Method: \(request.httpMethod ?? "Not Http Method detected")")
        print("Parameters: \(request.allHTTPHeaderFields ?? [String: String]())")
        print("--  Request End -- ")
    }
    
    func responseLog(request: URLRequest, data: Data?, response: HTTPURLResponse?) {
        print("--  📥 Response  📥 -- ")
        print("URL: \(request.url?.absoluteString ?? "Not URL detected")")
        print("Http Method: \(request.httpMethod ?? "Not Http Method detected")")
        print("Parameters: \(request.allHTTPHeaderFields ?? [String: String]())")
        print("HttpStatus: \(response?.statusCode ?? 0)")
        print("JSON Body: \(String(data: data ?? Data(), encoding: .utf8) ?? "Not JSON detected")")
        print("--  Response End -- ")
    }
}


