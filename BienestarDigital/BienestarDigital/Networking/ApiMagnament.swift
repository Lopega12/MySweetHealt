//
//  ApiMagnament.swift
//  BienestarDigital
//
//  Created by Loren on 02/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
import Alamofire
class ApiMagnament{
    
    let urlBase = "http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/list"
    
    func postApp(file: String){
        Alamofire.request(urlBase, method: .post, parameters: ["fichero":file], encoding: JSONEncoding.default, headers: nil).responseJSON{
            response in
            switch(response.result){
            case .success:
                print(response)
                break
            case .failure(let error):
                print(error);
            }
            
        }
    }
    func getAppDetail(app: String, completion: @escaping (TheApp?)-> Void) {
        var app = TheApp(name: "", latitude: 0.0, longitude: 0.0, time: "nil", imageURL: "")
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api", method: .get, parameters: ["app": app]).responseJSON{
            response in switch(response.result){
            case .success:
               print("patata")
               
            case .failure(let error):
                let app =  TheApp(name: "Clash Royale", latitude: 1.0, longitude: 10.1, time: "22:45", imageURL: "clash_royale_app")
                completion(app)
            }
        }
        
    }
    
    
}
