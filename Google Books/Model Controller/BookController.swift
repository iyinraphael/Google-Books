//
//  BookController.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/17/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class BookController {
    
    static let baseURL = URL(string: "https://www.googleapis.com/books/v1/volumes")!
    static let firebaseURL = URL(string: "https://message-board-8b6f1.firebaseio.com/")!
    var bookItems = [Book]()
    var myBookItems = [Book]()
    
    func book(at index: IndexPath) -> Book {
        return bookItems[index.row]
    }
    
    func numberOfRow() -> Int {
        return bookItems.count
    }
    

}
