//  Created giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Router -

import UIKit

//MARK: Router -
protocol MainScreenRouterProtocol: class {
    func push()
}

class MainScreenRouter: MainScreenRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainScreenViewController(nibName: nil, bundle: nil)
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        let presenter = MainScreenPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func push() {
        let addView = SecondScreenRouter.createModule() as! SecondScreenViewController// estacia a  viewController detalhe aluno
        
        //Pegar a controller
        if let homeView = viewController, let navigationController = homeView.navigationController{
            
            navigationController.pushViewController(addView, animated: true)
        }

    }
    
}
