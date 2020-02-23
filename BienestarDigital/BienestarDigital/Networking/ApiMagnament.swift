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
//        Parsear fichero con map y split para los saltos en cadena
        
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
    /**
     Obtener detalles de la app desde servidor dado una id de app
     */
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
    /**
     Obtener todas las apps (Para la vista Home)
     */
    func getAllApps(completion: @escaping ([TheApp])-> Void){
Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/allApps",
        method: .get, parameters: nil ).responseJSON{
            response in switch(response.result){
                case .success:
                    print("mis apps")
                case .failure(let error):
                let apps = self.dataHardcoded()
                completion(apps)
            }
        }
    }
    /**
     Obtener estadisticas de dias anterios(Vista detalles de la aplicacion)
     */
    func getBeforeDates(from: String, completion: @escaping ([Stat])-> Void){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/getDates",
                          method: .get, parameters: ["idApp": from]).responseJSON{
                            response in switch(response.result){
                            case .success:
                                print(response)
                            case .failure(let error):
                                let stats = self.statsHardcoded()
                                completion(stats)
                            }
                            
        }
    }
/**
     Obtener todas las reglas definidas por el usuario
     */
    func getRulesData(user: String, completion: @escaping ([TheApp])->Void){
    Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/getRules",method: .get, parameters: ["id_user":user]).responseJSON{
            response in switch(response.result){
            case .success:
                print(response)
            case .failure(let error):
                let rules = self.rulesHard()
                completion(rules)
            }
        }
    }
    /**
     Obtener las estadisitas de uso de apps por mes,dias, semanas
     */
    func getStats(orderBy: Int, completion: @escaping ([Stat])->Void){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/getStat",method: .get, parameters: ["order": orderBy]).responseJSON{
            response in switch(response.result){
            case .success:
                print(response)
            case .failure(let error):
                let stats = self.statsHardcoded()
                completion(stats)
            }
        }
    }
    /**
     Guardar una nueva regla
     */
    func postRule(rule: Rule,App: TheApp){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/getRules",method: .post, parameters: ["maxAllow":rule.maxAllow,"hInit":rule.hInit,"hFinish":rule.hFinish,"app_id":App.name]).responseJSON{
            response in switch(response.result){
            case .success:
                print("regla guardada")
            case .failure(let error):
                print("error del servidor")
            }
        }
    }
    /**
     Guardar cambios en la vista perfil(De momento solo el nombre)
     */
    func postChangeUser(User : [String:String]){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/updateUser",method: .post, parameters: nil).responseJSON{
            response in switch(response.result){
            case .success:
                print("regla guardada")
            case .failure(let error):
                print("error del servidor")
            }
        }
    }
    
    
    func postRegisterUser(User : [String:String], completion: @escaping (Bool)->Void){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/register",method: .post, parameters: nil).responseJSON{
            response in switch(response.result){
            case .success:
                print("Usuario guardado")
                completion(true);
                
            case .failure(let error):
                print("error del servidor")
                completion(true) // Cuando funcione el servidor poner en false para evitar pasar a la pantalla home sin registro correcto//
            }
        }
    }
    
    func postLogin(User : [String:String], completion: @escaping (Bool)->Void){
        Alamofire.request("http://localhost:8888/BienestarDigital_BackEnd/bienestar_api/public/api/login",method: .post, parameters: nil).responseJSON{
            response in switch(response.result){
            case .success:
                completion(true);
                
            case .failure(let error):
                print("error del servidor")
                completion(true) // Cuando funcione el servidor poner en false para evitar pasar a la pantalla home sin login correcto//
            }
        }
    }
    
    /**
     Funciones para datos hardcodeados si no hay coneion con el servidor
     */
    func dataHardcoded()-> [TheApp]{
        var apps : [TheApp] = []
        apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Pokemon Go", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "pokemongo"))
         apps.append(TheApp(name: "Gmail", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "ios-gmail-icon-24"))
         apps.append(TheApp(name: "Instagram", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "Instagram_icon"))
         apps.append(TheApp(name: "Reloj", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "https://enteratec.com/wp-content/uploads/2016/08/imagen-00-destacada.png"))
        return apps
        
    }
    func statsHardcoded()->[Stat]{
        var stats : [Stat] = []
        stats.append(Stat(fecha: "29-01-2019", time: "5h",nameApp: "Clash Royale"))
        stats.append(Stat(fecha: "23-01-2019", time: "10 min",nameApp: "Pokemon GO"))
        stats.append(Stat(fecha: "12-01-2019", time: "23 min",nameApp: "Gmail"))
        return stats
        
    }
    
    func rulesHard()->[TheApp]{
        var rules : [TheApp] = []
        rules.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app", rules: Rule(maxAllow: 4, hInit: "15:00", hFinish: "19:00")))
        rules.append(TheApp(name: "Pokemon Go", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "pokemongo", rules: Rule(maxAllow: 4, hInit: "15:00", hFinish: "19:00")))
        
        return rules
    }
    
    
}
