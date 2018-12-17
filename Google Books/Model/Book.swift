//
//  Book.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/17/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

struct Book: Codable {
    
    let items: [Items]
    
    struct Items: Codable {
        let volumeInfo: VolumeInfo
        
        struct VolumeInfo: Codable {
            let title: String
            let subtitle: String
            let authors: [Authors]
            let description: String
            let imageLinks: ImageLinks
            
            struct Authors: Codable {
                let firstAurthor: String
                let SecondAuthor: String?
            }
            
            struct ImageLinks: Codable {
                let thumbnail: String
            }
        }
    }
    
}
