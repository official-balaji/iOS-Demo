//
//  TableViewViewController.swift
//  Task1405
//
//  Created by Balaji U on 01/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var refHomeVM = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        refHomeVM.parse()
        // Do any additional setup after loading the view.
    }
    

}

extension TableViewViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowcount: Int = refHomeVM.numberOfRowsInSection(section: section)

        return rowcount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell

        let FetchData = refHomeVM.cellreturntest(indexPath: indexPath)

        cell!.setCellWithValuesOf(FetchData)
        return cell!

    }
}
