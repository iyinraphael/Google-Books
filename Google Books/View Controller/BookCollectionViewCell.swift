//
//  BookCollectionViewCell.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/16/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookshelfNameLabel: UILabel!
    
    func updateView(){
        if let book = book {
            guard let imageLink = book.volumeInfo.imageLinks,
                let imageData = try? Data(contentsOf: URL(string: imageLink.thumbnail)!) else {return}
            bookshelfNameLabel.text = book.volumeInfo.title
            bookImageView.image = UIImage(data:imageData)
            
        }
        
    }
    
    var book: Book?{
        didSet{
            updateView()
        }
    }
    let bookController = BookController()
    
}
