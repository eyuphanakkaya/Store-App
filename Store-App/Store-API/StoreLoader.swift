//
//  StoreLoader.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 23.02.2026.
//

import Foundation

public protocol StoreLoader {
    associatedtype Output
    
    func load() async throws -> Output
}
