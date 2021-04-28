//
//  ViewController.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/26/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var networkManger = NetworkManger()
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = 100.0
        
    }
    func dateFormater(Date:String) -> String? {
        let input = "12/10/2018"
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let date = formatter.date(from: input) {
            return formatter.string(from: date) // Prints:  2018-12-10 06:00:00 +0000
        }
        return nil
    }
    
    
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.networkManger.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! RepoCell
        
        cell.repoName.text = self.networkManger.repos[indexPath.row].name
        cell.ownerName.text = self.networkManger.repos[indexPath.row].owner.login
        cell.dateOfCreation.text = dateFormater(Date:self.networkManger.repos[indexPath.row].created_at)
        if let url = URL( string:self.networkManger.repos[indexPath.row].owner.avatar_url)
        {
            DispatchQueue.global().async {
              if let data = try? Data( contentsOf:url)
              {
                DispatchQueue.main.async {
                    cell.ownerImage.image = UIImage( data:data)
                }
              }
           }
        }
        return cell
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as! DescriptionViewController
       if let indexPath = tableView.indexPathForSelectedRow{
           destinationVC.repo = self.networkManger.repos[indexPath.row]
       }
   }
        

            
    
}
extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchtext = searchBar.text{
            if searchtext.count > 1{
                networkManger.fetchDate(Query: searchtext, onComplete: {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        }
    }
}

extension UIViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDescription", sender: self)
  }

}
