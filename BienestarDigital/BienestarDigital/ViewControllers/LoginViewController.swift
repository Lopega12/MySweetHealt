//
//  LoginViewController.swift
//  BienestarDigital
//
//  Created by Loren on 10/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController{
    @IBOutlet weak var LabelUser: UILabel!
    @IBOutlet weak var LabelPassword: UILabel!
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonRecover: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
        
    }
    
    func setupView(){
        buttonRegister.setTitle(LoginLiterals.ButtonRegistrar, for: .normal)
        buttonRecover.setTitle(LoginLiterals.ButtonRecover, for: .normal)
        buttonLogin.setTitle(LoginLiterals.ButtonLogin, for: .normal)
        LabelUser.text = LoginLiterals.LabelUser
        LabelPassword.text = LoginLiterals.LabelPass
    }
    
    @IBAction func LoginAction(_ sender: UIButton) {
        if(!inputEmail.text!.isEmpty && !(inputPassword.text!.isEmpty)){
         self.performSegue(withIdentifier: "Home", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Home"){
            
        }
    }
    
}
