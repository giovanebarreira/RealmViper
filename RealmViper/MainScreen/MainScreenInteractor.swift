//  Created giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Interactor -

import UIKit
import RealmSwift

//MARK: Interactor -
protocol MainScreenInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func loadItensOnPresenter(itens: Results<RealmObjectModel>)
}

protocol MainScreenInteractorInputProtocol: class {

    var presenter: MainScreenInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func reloadDataInteractor()
}

class MainScreenInteractor: MainScreenInteractorInputProtocol {

    weak var presenter: MainScreenInteractorOutputProtocol?
    
    func reloadDataInteractor() {
    
        
        if let presenter = presenter, let realm = RealmService.shared.getDataFromRealm() as? Results<RealmObjectModel>{
            presenter.loadItensOnPresenter(itens: realm)
        }
    }
    
}

