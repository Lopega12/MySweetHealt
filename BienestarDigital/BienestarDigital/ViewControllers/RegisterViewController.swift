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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func registerAction(_ sender: Any) {
    }
    func setupView(){
        labelName.text = RegisterLiterals.LabelName
        labelEmail.text = RegisterLiterals.LabelEmail
        labelPass.text = RegisterLiterals.LabelPassword
        labelRetype.text = RegisterLiterals.LabelRetype
        buttonRegister.setTitle(RegisterLiterals.ButtonRegister, for: .normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MainView"){
            
        }
    }
    
}
