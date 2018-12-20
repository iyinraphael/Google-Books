//
//  Book.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/17/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation


struct Book: Codable {
        
    let volumeInfo: VolumeInfo
    
    struct VolumeInfo: Codable {
        let title: String
        let subtitle: String?
        let authors: [String]?
        let description: String?
        let imageLinks: ImageLinks?
        
        struct ImageLinks: Codable {
            let thumbnail: String
        }
    
    }
    let identifier: String = UUID().uuidString
//    var isLiked = false

}



