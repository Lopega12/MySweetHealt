//
//  ViewController.swift
//  BienestarDigital
//
//  Created by Loren on 16/01/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
import CKCircleMenuView
class ViewController: UIViewController, CKCircleMenuDelegate, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "App", for: indexPath) as! AppsTableViewTableViewCell
        let app = apps[indexPath.row]
        cell.nameAppCell.text = app.name
        cell.imageAppCell.image = UIImage(named: (app.image)!)
        cell.timeAppCell.text = app.time
        return cell
    }
    

    @IBOutlet weak var MenuButton: UIButton!
    var menuButtonItems = Array<UIImage>()
    var optionsMenu = Dictionary<String,AnyObject>();
    var tPoint = CGPoint();
    var menuItemsLabel : [ String] = ["Home","Control","Stats","Perfil"]
    var circleMenuView = CKCircleMenuView()
    
    var apps : [TheApp] = []
    
    @IBOutlet weak var TableApps: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Data hardocded//
        apps = dataHardcoded()
        
        self.TableApps.dataSource = self
        self.TableApps.delegate = self
        tPoint = CGPoint(x:MenuButton.frame.midX, y: MenuButton.frame.midY)
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
    

    @IBAction func onClickMenu(_ sender: Any) {
        self.circleMenuView = CKCircleMenuView(atOrigin: tPoint, usingOptions: optionsMenu, withImageArray: self.menuButtonItems, andTitles: menuItemsLabel)
        self.view.addSubview(self.circleMenuView)
        self.circleMenuView.delegate = self
        self.circleMenuView.openMenu()
    }
    
    func circleMenuActivatedButton(with anIndex: Int32) {
        //Aqui va el proceso de dirigir al usuario a una pantalla especifica//
    }
    func dataHardcoded()-> [TheApp]{
        var apps : [TheApp] = []
        apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
         apps.append(TheApp(name: "Clash Royale", latitude: 9.2, longitude: 4.5, time: "1Hy32M", imageURL: "clash_royale_app"))
        return apps
        
    }

    
}

