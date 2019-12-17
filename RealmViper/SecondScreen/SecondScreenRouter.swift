//  Created giovane barreira on 04/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: Router -

import UIKit

//MARK: Router -
protocol SecondScreenRouterProtocol: class {
    
    func pop()
}

class SecondScreenRouter: SecondScreenRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SecondScreenViewController(nibName: nil, bundle: nil)
        let interactor = SecondScreenInteractor()
        let router = SecondScreenRouter()
        let presenter = SecondScreenPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func pop() {
        if let view = viewController, let navigation = view.navigationController {
            navigation.popViewController(animated: true)
        }
    }
}
