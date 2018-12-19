//
//  DetailViewController.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/16/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var aurthorNameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func addToShelf(_ sender: Any) {
    }
    
}
