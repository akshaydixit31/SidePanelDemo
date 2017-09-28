//
//  ContainerVc.swift
//  SidePanelDemo
//
//  Created by Appinventiv Technologies on 27/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ContainerVc: UIViewController {
    
    @IBOutlet weak var sidePanelView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        // ------- Getnotification --------
        NotificationCenter.default.addObserver(forName:NSNotification.Name("sideButtonTapped"),
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: {(notification) in
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.sidePanelView.transform = CGAffineTransform(translationX: 196, y: 0)
                
            })
        })
        
    // ---------- For return ------
        NotificationCenter.default.addObserver(forName:NSNotification.Name("sideButtonTappedInReturn"),
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: {(notification) in
                                                
                                                UIView.animate(withDuration: 0.5, animations: {
                                                    
                                                    self.sidePanelView.transform = CGAffineTransform(translationX: -196, y: 0)
                                                    
                                                })
        })

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.sidePanelView.transform = CGAffineTransform(translationX: -196, y: 0)
            
        })
        
    }

    

}
