//  Created giovane barreira on 04/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: View -

import UIKit

class SecondScreenViewController: UIViewController {

    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
	var presenter: SecondScreenPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func save(_ sender: UIButton) {
        presenter!.passData(title: txtTitle.text!, desc: txtDesc.text!)
    }
}

extension SecondScreenViewController: SecondScreenViewProtocol {
    

}
