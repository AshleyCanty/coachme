//
//  BasicInformationViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/5/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class BasicInformationViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }

}

class BasicInfoNibs {
//    let nibBasicInfo
    let nibBasic = UINib.init(nibName: "BasicInfoTableViewCell", bundle: nil)
    let nibBio = UINib.init(nibName: "BioTableViewCell", bundle: nil)
    let nibSubmit = UINib.init(nibName: "SubmitTableViewCell", bundle: nil)

}

extension BasicInformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0,1:
            return 70
        case 2:
            return 300
        default:
            return 100
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

extension BasicInformationViewController: UITableViewDataSource {
    
    func setupTableView() {
        tableView.register(BasicInfoNibs().nibBasic, forCellReuseIdentifier: "BasicInfoTableViewCell")
        tableView.register(BasicInfoNibs().nibBio, forCellReuseIdentifier: "BioTableViewCell")
        tableView.register(BasicInfoNibs().nibSubmit, forCellReuseIdentifier: "SubmitTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
            cell.title.text = "Name"
            cell.input.text = "Ashley Canty"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
            cell.title.text = "Location"
            cell.input.text = "Pleasatntville, NJ"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BioTableViewCell", for: indexPath) as! BioTableViewCell
            cell.title.text = "Bio"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitTableViewCell", for: indexPath) as! SubmitTableViewCell
            return cell
        }
    }
    
    
}
