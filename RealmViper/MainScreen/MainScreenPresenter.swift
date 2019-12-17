//  Created giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Presenter -

import UIKit
import RealmSwift
import Realm

//MARK: View -
protocol MainScreenViewProtocol: class {

    var presenter: MainScreenPresenterProtocol? { get set }
    /* Presenter -> ViewController */
    func setupTable()
    func callFromRealm()
}

//MARK: Presenter -
protocol MainScreenPresenterProtocol: class {

    var interactor: MainScreenInteractorInputProtocol? { get set }
    var arrayItens: Results<RealmObjectModel>? {get set}
    
    func didLoad()
    func addBtn()
    func getData()
}

class MainScreenPresenter: MainScreenPresenterProtocol {

    weak private var view: MainScreenViewProtocol?
    var interactor: MainScreenInteractorInputProtocol?
    private let router: MainScreenRouterProtocol
    var arrayItens: Results<RealmObjectModel>?
    

    init(interface: MainScreenViewProtocol, interactor: MainScreenInteractorInputProtocol?, router: MainScreenRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func didLoad() {
        if let view = view{
            view.setupTable()
            //view.callFromRealm()
            
        }
    }
    
    func getData() {
        if let interactor = interactor {
            interactor.reloadDataInteractor()
        }
    }
    
    func addBtn() {
        router.push()
    }
    
}

extension MainScreenPresenter: MainScreenInteractorOutputProtocol{
    func loadItensOnPresenter(itens: Results<RealmObjectModel>) {
       self.arrayItens = itens
        if let view = view {
            view.callFromRealm()
        }
    }
    
}
