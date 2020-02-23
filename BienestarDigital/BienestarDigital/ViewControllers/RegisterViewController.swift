//
//  RegisterViewController.swift
//  BienestarDigital
//
//  Created by Loren on 10/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class RegisterViewController: UIViewController{
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPass: UILabel!
    @IBOutlet weak var labelRetype: UILabel!
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputeEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var inputRetype: UITextField!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var buttonRegister: UIButton!
    let AF = ApiMagnament();
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if(inputName.text != "" && inputeEmail.text != "" && inputPassword.text != "" && inputRetype.text != "" ){
            if(inputPassword.text == inputRetype.text){
                AF.postRegisterUser(User: ["name":inputName.text!,"email":inputeEmail.text!,"pass": inputPassword.text!], completion: {
                    result in switch(result){
                       case true:
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
                        self.present(controller, animated: true, completion: nil)
                        case false:
                        break;
                    }
                })
            }else{
                let alert = UIAlertController(title: "Error", message: "Los campos contraseña y repetir contraseña no son iguales", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "Todos los campos son obligatorios", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    /**
            Establecer los campos de la vista
     */
    func setupView(){
        labelName.text = RegisterLiterals.LabelName
        labelEmail.text = RegisterLiterals.LabelEmail
        labelPass.text = RegisterLiterals.LabelPassword
        labelRetype.text = RegisterLiterals.LabelRetype
        buttonRegister.setTitle(RegisterLiterals.ButtonRegister, for: .normal)
        
    }
    
    
}
