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
    var bookItem = [Book]()
    var books = [Book]()
    
    
    func add(book: Book) {
        books.append(book)
    }

}
