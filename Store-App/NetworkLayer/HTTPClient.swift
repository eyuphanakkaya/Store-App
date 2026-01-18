//
//  HTTPClient.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 18.01.2026.
//

import Foundation

protocol HTTPClient {
    func get(_ url: URL, completion: @escaping (Result<(Data,HTTPURLResponse), Error>) -> Void)
}
