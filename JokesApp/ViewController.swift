//
//  ViewController.swift
//  JokesApp
//
//  Created by omrobbie on 10/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSetup: UILabel!
    @IBOutlet weak var txtDelivery: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJson()
    }

    func fetchJson() {
        let urlString = "https://sv443.net/jokeapi/category/programming"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
                return
            }

            guard let data = String(data: data!, encoding: .utf8) else {return}
            print(data)
        }.resume()
    }

    @IBAction func btnReload(_ sender: Any) {
        fetchJson()
    }
}
