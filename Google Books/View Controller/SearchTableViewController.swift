//
//  SearchTableViewController.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/16/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchName = searchBar.text else { return }
        bookController.fetctJson(with: searchName) { (bookItem, error) in
            DispatchQueue.main.async {
                self.bookController.bookItems = bookItem!
                self.tableView.reloadData()
                searchBar.resignFirstResponder()
            }
        }
        
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookController.numberOfRow()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
        let book = bookController.book(at: indexPath)
        cell.book = book
        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailView" {
            guard let index = tableView.indexPathForSelectedRow,
                let detailVc = segue.destination as? DetailViewController else {return}
            detailVc.book = bookController.book(at: index)
        }
    }
  
    @IBAction func createBookshelf(_ sender: Any) {
        let alert = UIAlertController(title: "Create a bookshelf", message: "This is an alert.", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "Create your Bookshelf"
//            guard let text = textField.text else {return}
//           self.newText = text
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            if let alertTextField = alert.textFields?.first, alertTextField.text != nil {
                guard let text = alertTextField.text else {return}
                self.bookController.createBookshelfName(for: text)
            }
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    let bookController = BookController()

    
}
