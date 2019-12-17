//
//  MainTableCell.swift
//  RealmViper
//
//  Created by giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {

    @IBOutlet weak var uiLblTitle: UILabel!
    @IBOutlet weak var uiLblDesc: UILabel!
    
    
  
    //Connect our cell labels with realm Object DB
    func configure(with realmObject: RealmObjectModel){
        uiLblTitle.text = realmObject.titleLbl
        uiLblDesc.text = realmObject.uiLblDesc
    }
}
