//
//  RuleViewController.swift
//  BienestarDigital
//
//  Created by Loren on 17/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
import CKCircleMenuView
class RuleViewController : UIViewController,CKCircleMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
        
    /**
     Vars of pod menu
     */
    @IBOutlet weak var menuButton: UIButton!
    var menuButtonItems = Array<UIImage>()
    var optionsMenu = Dictionary<String,AnyObject>();
    var tPoint = CGPoint();
    var menuItemsLabel : [ String] = ["Home","Control","Stats","Perfil"]
    var circleMenuView = CKCircleMenuView()
    /**
                Vars from this view
     */
    @IBOutlet weak var rulesCollection: UICollectionView!
    var listRules : [TheApp] = [];
    var AF = ApiMagnament()
    /**
     Actions and functions for pod menu funcionality
     */
    @IBAction func openMenu(_ sender: Any) {
        self.circleMenuView = CKCircleMenuView(atOrigin: tPoint, usingOptions: optionsMenu, withImageArray: self.menuButtonItems, andTitles: menuItemsLabel)
        self.view.addSubview(self.circleMenuView)
        self.circleMenuView.delegate = self
        self.circleMenuView.openMenu()
    }
    
    func loadData(list: [TheApp]){
        self.listRules = list
        self.rulesCollection.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMenuButton()
        AF.getRulesData(user: "1", completion: {
            result in
            self.loadData(list: result)
        })
        print(listRules.count)
        self.rulesCollection.dataSource = self
        self.rulesCollection.delegate = self
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
    /**
     Functions of collection view rules
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listRules.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "rule"
        let cell = rulesCollection.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as! RuleCollectionViewCell
        cell.imageApp.image = UIImage(named: listRules[indexPath.row].image!)
        cell.nameApp.text = listRules[indexPath.row].name
        return cell
    }
    
}
