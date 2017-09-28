//
//  SideMenuVc.swift
//  SidePanelDemo
//
//  Created by Appinventiv Technologies on 27/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class SideMenuVc: UIViewController {
    
    @IBOutlet weak var sideMenuTable: UITableView!
    
    let dataItem = ["Bicycle","Bike","Car"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //------ Register Cell nib........
        
        let cellNib = UINib(nibName: "SideMenuCell",
                            bundle: nil)
        sideMenuTable.register(cellNib,
                               forCellReuseIdentifier: "SideMenuCellId")
        //        -------------------------
        
        sideMenuTable.dataSource = self
        sideMenuTable.delegate = self
        
        
        
    }
    
    @IBAction func sideMenuButton(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("sideButtonTappedInReturn"),
                                        object: nil,
                                        userInfo: nil)
        
    }
    
}

extension SideMenuVc: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return dataItem.count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCellId",
                                                       for: indexPath) as? SideMenuCell else{
                                                        fatalError("cell Not found:")
        }
        cell.dataLabel.text = dataItem[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let showImageScene = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageVcId") as? ShowImageVc else{
            
            fatalError("Storyboard not found:")
            
        }
        
        showImageScene.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(showImageScene, animated: true)
        
    }
    
    
}
