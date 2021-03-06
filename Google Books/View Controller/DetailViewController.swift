//
//  DetailViewController.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/16/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let bookController = BookController()
    static var localBookshelf: [Book] = []
    var book: Book? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard isViewLoaded else {return}
        if let book = book {
            let imageLink = book.volumeInfo.imageLinks!
            let author = book.volumeInfo.authors!
            let subtitle = book.volumeInfo.subtitle
            let description = book.volumeInfo.description
            
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: URL(string: imageLink.thumbnail)!) else {return}
            
            DispatchQueue.main.async {
                self.bookImageView.image = UIImage(data: image)
                }

            }
            self.title = book.volumeInfo.title
            self.bookNameLabel.text = book.volumeInfo.title
            self.aurthorNameLabel.text = "\(author[0])"
            self.subtitleLabel.text = subtitle
            self.descriptionTextView.text = description
            
        }

    }
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var aurthorNameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func addToShelf(_ sender: Any) {
        
        bookController.put(book: book)
    
        let alert = UIAlertController(title: "Add to Book to Bookshelf", message: dispayMessage(), preferredStyle: .alert)
        
        for shelf in BookController.bookshelfNames {
        alert.addAction(UIAlertAction(title: NSLocalizedString(shelf, comment: "Default action"), style: .default, handler: { _ in
                if self.book != nil {
                    DetailViewController.localBookshelf.append(self.book!)
                    BookController.bookshelf[shelf] = DetailViewController.localBookshelf
                    print("\(BookController.bookshelf)")
                }
                NSLog("The \"OK\" alert occured.")
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
        print("\(BookController.bookshelfNames)")
    
    }
    
    func dispayMessage() -> String {
        let message = "You have \(BookController.bookshelfNames.count) Bookshelves"
        if BookController.bookshelfNames.count == 1 {
            let oneMessage = "You have 1 Bookshelf"
            return oneMessage
        } else {
            return message
        }
    }
    
}
