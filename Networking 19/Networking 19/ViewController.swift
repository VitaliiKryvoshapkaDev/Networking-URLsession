//
//  ViewController.swift
//  Networking 19
//
//  Created by Vitalii Kryvoshapka on 26.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    
    //Create NM
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func downloadPostsDidTap() {
        //Connect lable to Array of posts
        networkManager.getAllPosts { (posts) in
            //Add to mainQueue
            DispatchQueue.main.async {
                self.titleLable.text = "Posts has been downloaded!"
            }
        }
    }
}

