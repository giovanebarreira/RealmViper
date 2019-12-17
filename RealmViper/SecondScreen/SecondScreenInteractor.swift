//  Created giovane barreira on 04/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Interactor -

import UIKit

//MARK: Interactor -
protocol SecondScreenInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol SecondScreenInteractorInputProtocol: class {

    var presenter: SecondScreenInteractorOutputProtocol?  { get set }
    func saveDataInteractor(title: String, desc: String)

    /* Presenter -> Interactor */
}

class SecondScreenInteractor: SecondScreenInteractorInputProtocol {

    weak var presenter: SecondScreenInteractorOutputProtocol?
    
    func saveDataInteractor(title: String, desc: String) {
        let object = RealmObjectModel(titleLbl: title, uiLblDesc: desc)
        RealmService.shared.create(object)
        
    }
}
