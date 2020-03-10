//
//  ViewController.swift
//  JokesApp
//
//  Created by omrobbie on 10/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

struct Joke: Decodable {
    let setup: String
    let delivery: String
}

class ViewController: UIViewController {

    @IBOutlet weak var txtSetup: UILabel!
    @IBOutlet weak var txtDelivery: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJson()
    }

    func fetchJson() {
        let urlString = "https://sv443.net/jokeapi/v2/joke/Programming?type=twopart"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
                return
            }

            do {
                let result = try JSONDecoder().decode(Joke.self, from: data!)

                DispatchQueue.main.async {
                    self.txtSetup.text = result.setup
                    self.txtDelivery.text = result.delivery
                }
            } catch let jsonError {
                debugPrint("JSON Decoder Error: \(jsonError)")
            }
        }.resume()
    }

    @IBAction func btnReload(_ sender: Any) {
        fetchJson()
    }
}
