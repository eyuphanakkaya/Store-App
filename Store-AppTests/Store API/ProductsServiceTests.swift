//
//  ProductsServiceTests.swift
//  Store-AppTests
//
//  Created by Eyüphan Akkaya on 20.02.2026.
//

import XCTest
import Store_App

final class ProductsServiceTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy(result: .success(anyValidResponse()))
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    
    // MARK: - Helpers
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        private let result: Result<(Data, HTTPURLResponse), Error>
        
        init(result: Result<(Data, HTTPURLResponse), Error>) {
            self.result = result
        }
        
        func get(_ url: URL) async throws -> (Data, HTTPURLResponse) {
            requestedURLs.append(url)
            return try result.get()
        }
    }
    
    private func anyValidResponse() -> (Data, HTTPURLResponse) {
        let data = Data()
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (data, response)
    }
    
}
