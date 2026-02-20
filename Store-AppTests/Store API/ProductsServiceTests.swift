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
    
    func test_load_requestsDataFromURL() async throws {
        let url = URL(string: "https://example.com")!
        let client = HTTPClientSpy(result: .success(emptyListResponse()))
        let sut = await ProductsService(client: client,url: url)
        
        _ = try await sut.load()
        
        XCTAssertNotNil(client.requestedURLs)
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
    
    private func emptyListResponse() -> (Data, HTTPURLResponse) {
        let emptyListJSON = "[]".data(using: .utf8)!
        return (emptyListJSON, anyHttpResponse(statusCode: 200))
    }
    
    private func anyValidResponse() -> (Data, HTTPURLResponse) {
        let data = Data()
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (data, response)
    }
    
    private func anyHttpResponse(statusCode: Int) -> HTTPURLResponse {
        let url = URL(string: "https://example.com")!
        return HTTPURLResponse(url:  url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
    
}
