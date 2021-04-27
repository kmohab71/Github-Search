//
//  NetworkManger.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/27/21.
//

import Foundation
class NetworkManger : ObservableObject{
    
    @Published var repos = [RepoData]()
    
    func fetchDate( Query:String , onComplete: @escaping() -> Void){
        if let url = URL(string: "https://api.github.com/search/repositories?q="+Query) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Repo.self, from: safeData)
                            DispatchQueue.main.async {
                                self.repos = results.items
                                print(self.repos.count)
                                onComplete()
                            }
                            
                        } catch  {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
