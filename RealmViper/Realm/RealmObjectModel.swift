//
//  RealmObject.swift
//  RealmViper
//
//  Created by giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class RealmObjectModel: Object{
    
    dynamic var titleLbl: String = ""
    dynamic var uiLblDesc: String = ""
    
    convenience init(titleLbl: String, uiLblDesc: String) {
        self.init()
        self.titleLbl = titleLbl
        self.uiLblDesc = uiLblDesc
    }
    
}
