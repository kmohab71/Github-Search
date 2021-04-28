//
//  Repo.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/27/21.
//

import UIKit

struct Repo: Decodable {
    let items : [RepoData]
}
struct RepoData: Decodable, Identifiable{
    var id : Int
    let name: String
    let description: String?
    let owner: Owner
    let created_at: String
    let html_url:String
}
struct Owner: Decodable {
    let login : String
    let avatar_url : String
}
