//
//  Network.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/17/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

extension BookController {

    
    func fetctJson(with searchName: String, completion: @escaping ([Book]?, Error?) -> Void ) {
        
        var urlComponents = URLComponents(url: BookController.baseURL, resolvingAgainstBaseURL: true)
        let queryBookItem = URLQueryItem(name:"q", value: "\(searchName.lowercased())+terms")
        urlComponents?.queryItems = [queryBookItem]
        
        guard let requestURl = urlComponents?.url else {
            NSLog("Error requesting URL with \(searchName)")
            completion(nil, NSError())
            return
        }
        
        var request = URLRequest(url: requestURl)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, status, error) in
            guard let status = status as? HTTPURLResponse else { fatalError()}
            guard status.statusCode == 200 else {
                print("Invalid status: \(status.statusCode)")
                return
            }
            print("Okay status code")
            
            guard error == nil, let data = data else {
                if let error = error {
                    NSLog( "Error fetching data \(error)")
                    return
                }
                NSLog("Error grabbing data")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let bookItem = try jsonDecoder.decode(BookItem.self, from: data)
                self.bookItems = bookItem.items
//               print("\(bookItem.items[1].volumeInfo.authors)")
                completion(self.bookItems, nil)
            } catch {
                NSLog("Unable to decode data into bookItem: \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    
    
    func put(book: Book?, completion: @escaping ((Error?) -> Void) = { _ in } ) {
        let url = BookController.firebaseURL
            .appendingPathComponent(book!.identifier)
            .appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do{
            
            let jsonEncoder = JSONEncoder()
            request.httpBody = try jsonEncoder.encode(book)
        } catch {
            
            NSLog("Error occured when encoding\(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            
            if let error = error {
                NSLog("Error occured posting new json \(error)")
                completion(NSError())
                return
            }
            completion(nil)
        }.resume()
    }
    
    func request( completion: @escaping ((Error?) -> Void) = {_ in }) {
        let url = BookController.firebaseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: url ) { (data, _, error) in
            guard error == nil , let data = data else {
                if let error = error {
                    NSLog("Error occurred trying to retrieve data from Firebase \(error)")
                }
                return
                
            }
            do {
                let jsonDecoder = JSONDecoder()
                let newBookItem = try jsonDecoder.decode([String: Book].self, from: data).map({$0.value})
                self.myBookItems = newBookItem
                print("\(self.myBookItems)")
            } catch {
                NSLog("Error Decoding data \(error)")
            }

        }.resume()
        
    }

}
