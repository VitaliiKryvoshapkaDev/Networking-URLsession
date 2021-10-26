//
//  NetworkManager.swift
//  Networking 19
//
//  Created by Vitalii Kryvoshapka on 27.10.2021.
//

import Foundation


class NetworkManager{
    
    //Need @escaping in closure
    //Func Give all posts (pass closure)
    func getAllPosts(_ complitionHandler: @escaping ([Post]) -> Void){
        //Create URL (Unwrap...Better use Guard) [weak self] -
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts"){
            //Task (Shared Singelton) completionHandler - closure (after long operation)
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                //Closure Body
                if error != nil{
                    print("Error in request")
                } else {
                    if let resp = response as? HTTPURLResponse, resp.statusCode == 200,
                       //Need data
                       let responseData = data {
                        //load from JSON Array of posts
                        let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                        
                        //Back in closure
                        complitionHandler(posts ?? [])
                    }
                }
                //Always neet 'resume()'
            }.resume()
        }
    }
}
