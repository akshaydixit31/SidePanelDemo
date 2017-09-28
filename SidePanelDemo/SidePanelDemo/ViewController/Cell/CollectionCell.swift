//
//  CollectionCell.swift
//  SidePanelDemo
//
//  Created by Appinventiv Technologies on 28/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var describeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        super.touchesBegan(touches,with: event)
        
        NotificationCenter.default.post(name: NSNotification.Name("sideButtonTappedInReturn"),
                                        object: nil,
                                        userInfo: nil)
        
        
    }
    
    
}
