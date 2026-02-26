//
//  RemoteLoader.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 26.02.2026.
//

import Foundation


final class RemoteLoader<T> {
    private let client: HTTPClient
    private let url: URL
    private let mapper: (Data, URLResponse) throws -> T
    
    init(client: HTTPClient, url: URL, closure: @escaping (Data, URLResponse) throws -> T) {
        self.client = client
        self.url = url
        mapper = closure
    }
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    func load() async throws -> T {
        guard let (data, response) = try? await client.get(url) else {
            throw Error.connectivity
        }
        guard let model = try? mapper(data, response) else {
            throw Error.invalidData
        }
        
        return model
    }
}

