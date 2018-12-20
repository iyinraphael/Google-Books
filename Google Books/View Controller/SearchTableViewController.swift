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
                self.bookController.bookItem = bookItem!
                self.tableView.reloadData()
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
  

    let bookController = BookController()
}
