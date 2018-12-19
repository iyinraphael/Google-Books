//
//  SearchTableViewCell.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/16/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var book: Book? {
        didSet {
         updateView()
        }
    }
    
    func updateView() {
        
        if let book = book {
            bookNameLabel.text = book.volumeInfo.title
            guard let imagelink = book.volumeInfo.imageLinks,
            let imageData = try? Data(contentsOf: URL(string:imagelink.thumbnail)!),
            let aurthor = book.volumeInfo.authors else {return}
            bookImageView.image = UIImage(data: imageData)
            authorNameLabel.text = aurthor[0]
            
        }
        
        
    }
    
    @IBAction func isReadButton(_ sender: Any) {
        
    }
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
}
