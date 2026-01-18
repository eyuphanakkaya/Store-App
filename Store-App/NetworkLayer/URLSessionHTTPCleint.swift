//
//  URLSessionHTTPCleint.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 18.01.2026.
//

import Foundation


final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(_ url: URL, completion: @escaping (Result<(Data,HTTPURLResponse),Error>)-> Void) {
        session.dataTask(with: url) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data,response)))
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}
