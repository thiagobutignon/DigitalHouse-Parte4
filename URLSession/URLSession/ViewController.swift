//
//  ViewController.swift
//  URLSession
//
//  Created by Thiago B Claramunt on 11/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiAccess()
    
    }
    
    func apiAccess() {
        let session: URLSession = URLSession.shared
        let url: URL = URL(string: "https://sky-exercise.herokuapp.com/api/movies")!
        
        let task: URLSessionTask = session.dataTask(with: url) { (data, response, error) in
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                print("========== \n \n")
                print(json)
            }
            
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("======== \n \n")
                print(json as Any)
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            print(data)
            print("============= \n \n")
            print(response)
            print("============= \n \n")
            print(error)
        }
        
        task.resume()
    }


}

