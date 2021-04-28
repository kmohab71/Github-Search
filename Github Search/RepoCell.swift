//
//  RepoCell.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/27/21.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var dateOfCreation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    
}
