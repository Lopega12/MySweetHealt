//
//  ProfileController.swift
//  BienestarDigital
//
//  Created by Loren on 18/01/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
import UIKit
import CKCircleMenuView

class ProfileController : UIViewController,CKCircleMenuDelegate{
    var menuButtonItems = Array<UIImage>()
    var optionsMenu = Dictionary<String,AnyObject>();
    var tPoint = CGPoint();
    var menuItemsLabel : [ String] = ["Home","Control","Stats","Perfil"]
    var circleMenuView = CKCircleMenuView()
    
    @IBOutlet weak var menuButton: UIButton!
     /**
     variables de la vista en general
     */
    let AF = ApiMagnament();
    public var idUser = 1;
    @IBOutlet weak var saveChanges: UIButton!
    @IBOutlet weak var closeSesion: UIButton!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var notificationEnable: UISwitch!
    @IBOutlet weak var emailEnable: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         initMenuButton()
        saveChanges.setTitle(PerfilLiterals.ButtonSave, for: .normal)
        closeSesion.setTitle(PerfilLiterals.ButtonClose, for: .normal)
    }
    
    @IBAction func openMenu(_ sender: Any) {
        self.circleMenuView = CKCircleMenuView(atOrigin: tPoint, usingOptions: optionsMenu, withImageArray: self.menuButtonItems, andTitles: menuItemsLabel)
        self.view.addSubview(self.circleMenuView)
        self.circleMenuView.delegate = self
        self.circleMenuView.openMenu()
    }
    
    @IBAction func saveChangesAction(_ sender: Any) {
        if(textName.text!.isEmpty){
            let alert = UIAlertController(title: "Atención", message: "El campo nombre no puede quedarse en blanco", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            AF.postChangeUser(User: ["Name":textName.text!,"id": "\(idUser)"])
            let alert = UIAlertController(title: "Ok", message: "Guardado Correcto", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func circleMenuActivatedButton(with anIndex: Int32) {
        //Aqui va el proceso de dirigir al usuario a una pantalla especifica//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch anIndex {
        case 0:
            let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
            self.present(controller, animated: true, completion: nil)
        case 1:
            let controller = storyboard.instantiateViewController(withIdentifier: "ReglasController")
            self.present(controller, animated: true, completion: nil)
        case 2:
            let controller = storyboard.instantiateViewController(identifier: "StatsController")
            self.present(controller, animated: true, completion: nil)
        case 3:
            let controller = storyboard.instantiateViewController(withIdentifier: "ProfileController")
            self.present(controller, animated: true, completion: nil)
        
            
        default:
            print("Button Invalid")
            break;
        }
    }
    
    private func initMenuButton() {
        tPoint = CGPoint(x:menuButton.frame.midX, y: menuButton.frame.midY)
        self.menuButtonItems.append(UIImage(named: "mobile-app")!)
        self.menuButtonItems.append(UIImage(named: "passage-of-time")!)
        self.menuButtonItems.append(UIImage(named: "growth")!)
        self.menuButtonItems.append(UIImage(named:  "contacts")!)
        /**
         Options Pod Circle Menu
         */
        optionsMenu[CIRCLE_MENU_OPENING_DELAY]=0.1 as AnyObject
        optionsMenu[CIRCLE_MENU_MAX_ANGLE]=180.0 as AnyObject
        optionsMenu[CIRCLE_MENU_RADIUS]=105.0 as AnyObject
        optionsMenu[CIRCLE_MENU_DIRECTION] = Int(CircleMenuDirectionUp.rawValue) as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_BACKGROUND_NORMAL] = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        optionsMenu[CIRCLE_MENU_BUTTON_BACKGROUND_ACTIVE] = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        optionsMenu[CIRCLE_MENU_BUTTON_BORDER] = UIColor.white
        optionsMenu[CIRCLE_MENU_DEPTH] = 2.0 as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_RADIUS] = 35.0 as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_BORDER_WIDTH] = 2.0 as AnyObject
        optionsMenu[CIRCLE_MENU_TAP_MODE] = true as AnyObject
        optionsMenu[CIRCLE_MENU_LINE_MODE] = true as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_TINT] = false as AnyObject
        optionsMenu[CIRCLE_MENU_BACKGROUND_BLUR] = false as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_TITLE_VISIBLE] = true as AnyObject
        optionsMenu[CIRCLE_MENU_BUTTON_TITLE_FONT_SIZE] = 13.0 as AnyObject
    }
    
    
}
