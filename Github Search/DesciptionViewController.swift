//
//  DesciptionViewController.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/28/21.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var owerName: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    var repo:RepoData?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPage()
        
    }
    func loadPage() {
        
        if let safeRepo = repo{
            print(safeRepo)
            repoName.text = safeRepo.name
            owerName.text = safeRepo.owner.login
            repoDescription.text = safeRepo.description
            if let url = URL( string:safeRepo.owner.avatar_url)
            {
                DispatchQueue.global().async {
                    if let data = try? Data( contentsOf:url)
                    {
                        DispatchQueue.main.async {
                            self.ownerImage.image = UIImage( data:data)
                        }
                    }
                }
            }
            
        }
        
    }
    @IBAction func openURL(_ sender: UIButton) {
        if let safeURL = repo?.html_url{
            if let url = URL(string: safeURL) {
                UIApplication.shared.open(url)
            }
            
        }
    }
}
