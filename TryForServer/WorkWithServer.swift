//
//  WorkWithServer.swift
//  TryForServer
//
//  Created by Anatolich Mixaill on 06.07.2022.
//

import Foundation
struct WorkWithServer{
    
    func GETRequest()-> String{
        var req="Some text"
        let url = URL(string: "http://localhost:3000/users/test")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            req = String(data: data, encoding: .utf8)!
            print(req)
            
        }
        task.resume()
        return req
    }
    
    func POSTRequest(StringToSend: String){
        let url = URL(string: "http://localhost:3000/users/test")!
        var request:NSMutableURLRequest = NSMutableURLRequest(url:url)
        request.httpMethod = "POST"
        
        request.httpBody = StringToSend.data(using: .utf8)
        print(request.httpBody)
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            print(request.httpBody)
        }
        
        print(request)
    }

}
