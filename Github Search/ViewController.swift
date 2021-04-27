//
//  ViewController.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/26/21.
//

import UIKit

class ViewController: UIViewController {
    let networkManger = NetworkManger()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkManger.fetechDate(Query: "Swift")

    }

}

