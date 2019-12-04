//
//  NetworkManager.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 12. 02..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation
import Alamofire


class SearchAPI {
    static let shared = SearchAPI()
    
    private let baseURL = "https://WBHHAMHYNM-dsn.algolia.net"
    private let path  = "/1/indexes/cocoapods/query"
    private let APIkey = "4f7544ca8701f9bf2a4e55daff1b09e9"
    private let APIid = "WBHHAMHYNM"
    
    func search(for text: String, completion: @escaping (Result<QueryResponse, SearchAPIError>) -> Void) {
        let url = baseURL.appending(path)
        let headers: HTTPHeaders = [ "X-Algolia-API-Key": "4f7544ca8701f9bf2a4e55daff1b09e9",
                                     "X-Algolia-Application-Id": "WBHHAMHYNM",
                                     "Content-Type" : "application/json"]
        let query = "query=\(text)&hitsPerPage=20&page=0"
        let parameters = ["params": query] //as [String : Any]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                guard let jsonData = response.data, let content = try? JSONDecoder().decode(QueryResponse.self, from: jsonData) else {
                    return completion(.failure(SearchAPIError.unknown))
                }
                completion(.success(content))
            case .failure:
                completion(.failure(SearchAPIError.unknown))
            }
        }
    }
    
    enum SearchAPIError: Error {
        case server
        case unknown
    }
    
    enum Result<Value, E: Error> {
        case success(Value)
        case failure(E)
    }
}
