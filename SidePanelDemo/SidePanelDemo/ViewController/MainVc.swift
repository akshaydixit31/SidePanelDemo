//
//  MainVc.swift
//  SidePanelDemo
//
//  Created by Appinventiv Technologies on 27/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class MainVc: UIViewController {
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    
    let postName = ["Plumber","Teacher","Driver","Waiter","Painter"]
    let companyName = ["PKS Exports Pvt Ltd","PKS International School","PKS Taxi Service Pvt Ltd","PKS Restaurant","PKS Service Pvt Ltd"]
    var isList = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------- Register Cell-------
        
        let cellNib = UINib(nibName: "CollectionCell",
                            bundle: nil)
        postCollectionView.register(cellNib,
                                    forCellWithReuseIdentifier: "CollectionCellId")
        
        self.postCollectionView.dataSource = self
        self.postCollectionView.delegate = self
        
    }
    
    
    @IBAction func sideMenuButton(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("sideButtonTapped"),
                                        object: nil,
                                        userInfo: nil)
        
    }
    
    @IBAction func showListButton(_ sender: UIButton) {
        
        isList = !isList
        
        if isList{
            
            self.showImage.image = UIImage(named: "list")
            
        }else{
            
            self.showImage.image = UIImage(named: "grid")
            
        }
        
        UIView.transition(with: postCollectionView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.postCollectionView.reloadData()
                            
        },
                          completion: nil)
        
    }
}

extension MainVc: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return postName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellId",
                                                            for: indexPath) as? CollectionCell else{
                                                                
                                                                fatalError("Cell not found")
                                                                
        }
        
        cell.postLabel.text = self.postName[indexPath.row]
        cell.describeLabel.text = self.companyName[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isList{
            
            return CGSize(width: UIScreen.main.bounds.width,
                          height: 150)
            
        }else{
            
            return CGSize(width: UIScreen.main.bounds.width/2 - 5,
                          height: UIScreen.main.bounds.width/2 - 5)
            
        }
    }
    
    
}



















