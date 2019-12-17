//  Created giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//
//  Component: View -

import UIKit
import RealmSwift
import Realm

class MainScreenViewController: UIViewController {

    @IBOutlet weak var uiTableMain: UITableView!
    var presenter: MainScreenPresenterProtocol?
    let identifier = "mainCell"
    

	override func viewDidLoad() {
        super.viewDidLoad()
        let config = Realm.Configuration(objectTypes: [RealmObjectModel.self])
        let realm = try! Realm(configuration: config)
        
        presenter?.didLoad()
        presenter?.getData()
        
        // Get on-disk location of the default Realm
       
        print("Realm is located at:", realm.configuration.fileURL!)
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter?.getData()
    }
}


extension MainScreenViewController: MainScreenViewProtocol{
  
    func setupTable(){
        uiTableMain.dataSource = self
        uiTableMain.delegate = self
        //uiTableMain.estimatedRowHeight = 500
        
        //Instantiate Xib
        let nib = UINib(nibName: "MainTableCell", bundle: nil)
        uiTableMain.register(nib, forCellReuseIdentifier: identifier)
        
        //Add nav bar btn
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
       presenter?.addBtn()
    }
    
    func callFromRealm() {
        uiTableMain.reloadData()
    }
}


extension MainScreenViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        
        if let presenter = presenter, let itens = presenter.arrayItens{
            numberOfRows = itens.count
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = uiTableMain.dequeueReusableCell(withIdentifier: identifier) as! MainTableCell
        

        if let presenter = presenter, let itens = presenter.arrayItens{
            let itensLine = itens[indexPath.row]
            
            //Se criar tudo como Result<Object>, necessaário fazer o typeCasting "is" aqui,
            // faz-se o casting do item quando utilizado
            cell.configure(with: itensLine)
        }
        
        return cell
    }
    
    
    
}

extension MainScreenViewController: UITableViewDelegate{
    
}
