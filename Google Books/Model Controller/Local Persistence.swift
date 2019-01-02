//
//  Local Persistence.swift
//  Google Books
//
//  Created by Iyin Raphael on 1/1/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation

extension BookController {
    
    var bookshelfNamesURL: URL?{
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let filename = "Google Books.plist"
        return documentDirectory.appendingPathComponent(filename)
    }
    
    func saveToPersistence(){
        guard let bookshelfNamesURL = bookshelfNamesURL else {return}
        let plistEncoder = PropertyListEncoder()
        do{
            let data = try plistEncoder.encode(bookshelfNamesURL)
            try data.write(to: bookshelfNamesURL)
        }catch let error {
            NSLog("Error occured while saving: \(error)")
        }
    }
    
    func loadToPersistence(){
        let fm = FileManager.default
        guard let bookshelfNamesURL = bookshelfNamesURL, fm.fileExists(atPath: bookshelfNamesURL.path) else {return}
        let plistDecoder = PropertyListDecoder()
        do{
            let data = try Data(contentsOf: bookshelfNamesURL)
            let decodedNames = try plistDecoder.decode([String].self, from: data)
            BookController.bookshelfNames = decodedNames
        }catch let error{
            NSLog("Error occured while saving: \(error)")
        }
        
    }
}
