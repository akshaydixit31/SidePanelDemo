//
//  ShowImageVc.swift
//  SidePanelDemo
//
//  Created by Appinventiv Technologies on 28/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ShowImageVc: UIViewController {

    //  MARK:- Outlets ---------
    
    @IBOutlet weak var showDataCollection: UICollectionView!
    
     //  MARK:- Variable's ---------
    var selectedIndex = 0
    let biCycle = ["Atlas","Avon","Hero","TrekBicycle","Atlas","Avon","Hero","TrekBicycle"]
    let bike = ["CRF","F3","Fazer","Glamour","Street Triple","z1","CRF","F3","Fazer","Glamour","Street Triple","z1"]
    let car = ["Ford","Swift","Vitara","Ford","Swift","Vitara","Ford","Swift","Vitara"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- Register nib's----
        
        let cellNib = UINib(nibName: "showImageCell", bundle: nil)
        self.showDataCollection.register(cellNib, forCellWithReuseIdentifier: "showImageCellId")
        
        self.showDataCollection.dataSource = self
        self.showDataCollection.delegate = self

        
    }

    @IBAction func backButton(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension ShowImageVc: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch selectedIndex {
            
        case 0:
            return biCycle.count
            
        case 1:
            return bike.count
            
        default:
           return car.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showImageCellId",
                                                            for: indexPath) as? showImageCell else {
            fatalError("Cell not found:")
        }
        
        switch selectedIndex {
            
        case 0:
            
            cell.dataImage.image = UIImage(named: biCycle[indexPath.row])
            cell.dataLabel.text = biCycle[indexPath.row]
            
        case 1:
            
            cell.dataImage.image = UIImage(named: bike[indexPath.row])
            cell.dataLabel.text = bike[indexPath.row]
            
        default:
            
            cell.dataImage.image = UIImage(named: car[indexPath.row])
            cell.dataLabel.text = car[indexPath.row]
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: UIScreen.main.bounds.width/2 - 5,
                      height: UIScreen.main.bounds.width/2 - 5)
        
    }
    
    
}
