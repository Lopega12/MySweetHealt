//
//  StatsViewController.swift
//  BienestarDigital
//
//  Created by Loren on 17/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
import CKCircleMenuView
class StatsViewController : UIViewController,CKCircleMenuDelegate, UITableViewDataSource,UITableViewDelegate{
    
    
    /**
     Vars for pod menu
     */
    var menuButtonItems = Array<UIImage>()
    var optionsMenu = Dictionary<String,AnyObject>();
    var tPoint = CGPoint();
    var menuItemsLabel : [ String] = ["Home","Control","Stats","Perfil"]
    var circleMenuView = CKCircleMenuView()
     
    var stats : [Stat] = []
    
    @IBOutlet weak var menuButton: UIButton!
    /**
     Vars of view
     */
    @IBOutlet weak var statsTable: UITableView!
    @IBOutlet weak var selectTime: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMenuButton()
    }
    /**
     for pod menu
     */
    @IBAction func openMenu(_ sender: Any) {
        self.circleMenuView = CKCircleMenuView(atOrigin: tPoint, usingOptions: optionsMenu, withImageArray: self.menuButtonItems, andTitles: menuItemsLabel)
        self.view.addSubview(self.circleMenuView)
        self.circleMenuView.delegate = self
        self.circleMenuView.openMenu()
    }
    /**
     Properties from pod menu
     */
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
    /**
     actions from selected button in pod menu
     */
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
    
    @IBAction func selecTime(_ sender: Any) {
        switch selectTime.selectedSegmentIndex{
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            print ("Option of default")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "stat"
        let cell = statsTable.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! StatTableViewCell
        //No puedo seguir por aqui asigando por que no puedo asginar outlets en el controlador de la celda.
        return cell
    }
}
