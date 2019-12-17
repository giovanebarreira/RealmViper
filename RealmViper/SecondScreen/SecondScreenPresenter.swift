//  Created giovane barreira on 04/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Presenter -

import UIKit

//MARK: View -
protocol SecondScreenViewProtocol: class {

    var presenter: SecondScreenPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}

//MARK: Presenter -
protocol SecondScreenPresenterProtocol: class {

    var interactor: SecondScreenInteractorInputProtocol? { get set }
    func passData(title: String, desc: String)
}

class SecondScreenPresenter: SecondScreenPresenterProtocol, SecondScreenInteractorOutputProtocol {

    weak private var view: SecondScreenViewProtocol?
    var interactor: SecondScreenInteractorInputProtocol?
    private let router: SecondScreenRouterProtocol

    init(interface: SecondScreenViewProtocol, interactor: SecondScreenInteractorInputProtocol?, router: SecondScreenRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func passData(title: String, desc: String) {
        if let interactor = interactor {
            interactor.saveDataInteractor(title: title, desc: desc)
            router.pop()
        }
    }

}
