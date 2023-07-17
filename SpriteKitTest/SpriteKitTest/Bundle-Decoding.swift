//
//  Bundle-Decoding.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 17/07/23.
//

import Foundation

extension Bundle {
    func decode <T:Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to laod \(url)")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(data)")
        }
        
        return loaded
    }
}
