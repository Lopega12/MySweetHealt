//
//  NewRuleViewController.swift
//  BienestarDigital
//
//  Created by Loren on 17/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class NewRuleViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    public var applist:[TheApp] = [];
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return applist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "selectApp"
        let cell = appSelector.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionCellViewApp
        cell.imageApp.image = UIImage(named: applist[indexPath.section].image!)
        cell.nameApp.text = applist[indexPath.section].name
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    
    @IBOutlet weak var appSelector: UICollectionView!
    
    override func viewDidLoad() {
        initSelectedApps()
        
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        initSelectedApps()
    }
    
    func initSelectedApps(){
        self.appSelector.dataSource = self
        self.appSelector.delegate = self
    }
}
