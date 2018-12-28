//
//  UserProfileViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/9/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class UserProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate  {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setTableView()
        }
    }
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.emptyBorderColor = Colors().lightGray
        view.settings.filledColor = Colors().starFillColor
        view.settings.filledBorderColor = Colors().starFillColor
        view.settings.emptyImage = UIImage(named: "emptyStar")?.withRenderingMode(.alwaysOriginal)
        view.settings.filledImage = UIImage(named: "fulltar")?.withRenderingMode(.alwaysOriginal)
        return view
        
    }()
    
    lazy var borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.frame.size.height = 1
        view.frame.size.width = 100
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userDefaults = UserDefaults.standard
    let nibUserIntro = UINib.init(nibName: "UserIntroTableViewCell", bundle: nil)
    let nibAboutMe = UINib.init(nibName: "AboutMeViewCell", bundle: nil)
    let nibReviews = UINib.init(nibName: "ReviewsTableViewCell", bundle: nil)
    let nibPhotos = UINib.init(nibName: "PhotosTableViewCell", bundle: nil)
    let nibAddReview = UINib.init(nibName: "AddReviewTableViewCell", bundle: nil)
    let nibSeeAllReviews = UINib.init(nibName: "SeeMoreTableViewCell", bundle: nil)
    let nibServices = UINib.init(nibName: "ServicesTableViewCell", bundle: nil)
    
    let container = UIView()
    let header = UILabel()
    let rateQuestion = UILabel()
    let textbox = UITextView()
    let charCount = UILabel()
    let submitBtn = UIButton(type: .system)
    let cancelBtn = UIButton(type: .system)
    
    var index = 0
    var limit = 3
    var fetchingMore = false
    lazy var counter = 0
    lazy var headerView: UIView = {
        let superViewHeight = CGFloat((UIApplication.shared.keyWindow?.frame.height)!)
        let superViewWidth = CGFloat((UIApplication.shared.keyWindow?.frame.width)!)
        
        let headerView = UIView()
        headerView.frame.size = CGSize(width: superViewWidth, height: superViewHeight)
        headerView.center.y = self.view.center.y
        headerView.center.x = -headerView.frame.width/2
        headerView.backgroundColor = Colors().darkGreyBackground
        
        var buttonStackView = UIStackView(arrangedSubviews: [submitBtn, cancelBtn])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 30
        buttonStackView.distribution = .fillEqually
        
        headerView.addSubview(container)
        container.addSubview(header)
        container.addSubview(rateQuestion)
        container.addSubview(textbox)
        container.addSubview(charCount)
        container.addSubview(buttonStackView)
        container.addSubview(cosmosView)
        container.addSubview(borderBottom)
        
        submitBtn.addTarget(self, action: #selector(submitReviewsClicked), for: .touchUpInside)
        submitBtn.tag = 1
        cancelBtn.addTarget(self, action: #selector(removeAddReviews), for: .touchUpInside)
        cancelBtn.tag = 1
        
        container.layer.cornerRadius = 8
        container.clipsToBounds = true
        textbox.layer.cornerRadius = 8
        textbox.clipsToBounds = true
        submitBtn.layer.cornerRadius = 8
        submitBtn.clipsToBounds = true
        cancelBtn.layer.cornerRadius = 8
        cancelBtn.clipsToBounds = true
        
        container.backgroundColor = Colors().lightGreyBackground
        header.backgroundColor = Colors().lightGreen
        rateQuestion.textColor = UIColor.white
        textbox.backgroundColor = UIColor.white
        submitBtn.backgroundColor = Colors().lightGreen
        cancelBtn.backgroundColor = Colors().lightGreen
        
        header.text = "Add a review"
        header.textColor = UIColor.white
        header.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        header.textAlignment = NSTextAlignment.center
        rateQuestion.text = "How would you rate this experience?"
        textbox.text = "Write a review (optional)"
        textbox.textColor = UIColor.lightGray
        textbox.font = UIFont.systemFont(ofSize: 16)
        charCount.text = "800"
        charCount.textAlignment = .right
        charCount.textColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.7)
        submitBtn.titleLabel?.textColor = UIColor.white
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        cancelBtn.titleLabel?.textColor = UIColor.white
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        
        var allConstraints: [NSLayoutConstraint] = []
        let views: [String: Any] = ["container": container, "header": header, "rateQuestion": rateQuestion, "textbox": textbox, "charCount": charCount, "buttonStackView":buttonStackView]
    
        container.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        rateQuestion.translatesAutoresizingMaskIntoConstraints = false
        textbox.translatesAutoresizingMaskIntoConstraints = false
        charCount.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8).isActive = true
        cosmosView.topAnchor.constraint(equalTo: rateQuestion.bottomAnchor, constant: 8).isActive = true
        
        borderBottom.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8).isActive = true
        borderBottom.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 8).isActive = true
        borderBottom.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 10).isActive = true
        
        
        let containerVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[container]", options: [], metrics: nil, views: views)
        allConstraints += containerVerticalConstraints
        let containerHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[container]-12-|", options: [], metrics: nil, views: views)
        allConstraints += containerHorizontalConstraints
        
        let VerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[header(50)]-16-[rateQuestion(15)]-50-[textbox(180)]-8-[charCount(12)]-16-[buttonStackView(45)]-8-|", options: [], metrics: nil, views: views)
        allConstraints += VerticalConstraints
        
        let headerHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[header]-0-|", options: [], metrics: nil, views: views)
        allConstraints += headerHorizontalConstraints
        
        let rateQuestionHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[rateQuestion]-|", options: [], metrics: nil, views: views)
        allConstraints += rateQuestionHorizontalConstraints
        
        let textboxHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[textbox]-8-|", options: [], metrics: nil, views: views)
        allConstraints += textboxHorizontalConstraints
        
        let charCountHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[charCount]-8-|", options: [], metrics: nil, views: views)
        allConstraints += charCountHorizontalConstraints
  
        let buttonStackHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-8-[buttonStackView]-8-|", options: [], metrics: nil, views: views)
        allConstraints += buttonStackHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        return headerView
        
    }()
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    var headlines = [
        Headline(title: "About me", text: "first"),
        Headline(title: "Joey Rockout", text: "second"),
        Headline(title: "Photos", text: "third")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NavigationTitles.Profile
        navigationItem.hidesBackButton = true
        userDefaults.set("profile", forKey: "tab")
        textbox.delegate = self as? UITextViewDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let total: Int = (textView.text.count)
        let remainder =  400 - total
        
        if total < 400 {
            charCount.text = String(remainder)
            textView.isEditable = true
            headerView.setNeedsDisplay()
        } else {
            textView.isEditable = false
        }
    }
    
    @objc func showPhotos(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "PhotosCollectionViewController") as! PhotosCollectionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushToSeeAllReviewsView(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeeReviewsViewController") as! SeeReviewsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addReviewClicked() {
        UIApplication.shared.keyWindow?.addSubview(self.headerView)
        UIApplication.shared.keyWindow?.bringSubviewToFront(self.headerView)
        headerView.center.x = -headerView.frame.width/2
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            self.textbox.text = "Leave a review (optional)."
            self.headerView.center.x = self.view.center.x
        })
    }
    
    @objc func submitReviewsClicked(){
        headlines.insert((Headline(title: "JackTheRipper", text: "I have jokes.")), at: 0)
        removeAddReviews()
        reloadTableData()
    }
    
    @objc func removeAddReviews(){
    
        self.headerView.removeFromSuperview()
    }
    
    @objc func reloadTableData() {
        if userDefaults.string(forKey: "tab") == "reviews" {
            index = 0
        }
        self.tableView.dataSource = nil
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.reloadData()
    }
    
    func setTableView(){
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.delaysContentTouches = false
        self.tableView.register(nibUserIntro, forCellReuseIdentifier: "UserIntroTableViewCell")
        self.tableView.register(nibAboutMe, forCellReuseIdentifier: "AboutMeViewCell")
        self.tableView.register(nibReviews, forCellReuseIdentifier: "ReviewsTableViewCell")
        self.tableView.register(nibPhotos, forCellReuseIdentifier: "PhotosTableViewCell")
        self.tableView.register(nibAddReview, forCellReuseIdentifier: "AddReviewTableViewCell")
        self.tableView.register(nibSeeAllReviews, forCellReuseIdentifier: "SeeMoreTableViewCell")
        self.tableView.register(nibServices, forCellReuseIdentifier: "ServicesTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tab = userDefaults.string(forKey: "tab")
        
        switch tab {
        case "profile":
            return StaticStrings.headlines.count
        case "services":
            return 2
        case "reviews":
            return 6
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tab = userDefaults.string(forKey: "tab")
//        return UITableView.automaticDimension
        
        switch tab {
            case "profile":
                if indexPath.row == 0 {
                    return UserIntroTableViewCell().userIntroCellHeight
                } else if indexPath.row == 1 {
//                    return AboutMeViewCell().aboutCellHeight
                    return UITableView.automaticDimension

                } else {
                    return PhotosTableViewCell().photosCellHeight
                }
            case "services":
                if indexPath.row == 0 {
                    return UserIntroTableViewCell().userIntroCellHeight
                } else {
                    return ServicesTableViewCell().servicesCellHeight
                }
            case "reviews":
                if indexPath.row == 0 {
                    return UserIntroTableViewCell().userIntroCellHeight
                } else if indexPath.row == 1 {
                    return AddReviewTableViewCell().buttonCellHeight
                } else if indexPath.row == 5{
                    return SeeMoreTableViewCell().seeMoreCellHeight
                } else {
                    return ReviewsTableViewCell().reviewsCellHeight
                }
            default:
                return 300
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tab = userDefaults.string(forKey: "tab")
        var cell: UITableViewCell
        
        switch tab {
        case "profile":
            cell = getProfileCells(indexPath)
            return cell
        case "services":
            cell = getServicesCells(indexPath)
            return cell
        case "reviews":
            cell = getReviewsCells(indexPath)
            return cell
        default:
            cell = getProfileCells(indexPath)
            return cell
        }
    }
    
    func getReviewsCells(_ indexPath: IndexPath) -> UITableViewCell{
        
        let row = indexPath.row
        
        switch row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddReviewTableViewCell", for: indexPath) as! AddReviewTableViewCell
                cell.addReviewButton.tag = indexPath.row
                cell.addReviewButton.addTarget(self, action: #selector(addReviewClicked), for: .touchUpInside)
                return cell
            case 2,3,4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
                
                cell.reviewText.text = headlines[indexPath.row-2].text
                cell.reviewAuthor.text = headlines[indexPath.row-2].title
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SeeMoreTableViewCell", for: indexPath) as! SeeMoreTableViewCell
                cell.seeAllReviewsButton.setTitle(LinkTitles.SeeReviewsButton, for: .normal)
                cell.seeAllReviewsButton.tag = indexPath.row
                cell.seeAllReviewsButton.addTarget(self, action: #selector(pushToSeeAllReviewsView), for: .touchUpInside)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                return cell
        }
    }
    
    
    func getServicesCells(_ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.profileBtn.tag = indexPath.row
            cell.profileBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.servicesBtn.tag = indexPath.row
            cell.servicesBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.reviewsBtn.tag = indexPath.row
            cell.reviewsBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell") as! ServicesTableViewCell

            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
            
        }
    }
    
    func getProfileCells(_ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.profileBtn.tag = indexPath.row
            cell.profileBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.servicesBtn.tag = indexPath.row
            cell.servicesBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.reviewsBtn.tag = indexPath.row
            cell.reviewsBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeViewCell", for: indexPath) as! AboutMeViewCell
            cell.label.text = StaticStrings.AboutMe
            
            if StaticStrings.headlines[1].text != "" {
                    cell.textView.text = StaticStrings.headlines[1].text
//                cell.textView.text = StaticStrings.EmptySection
            } else {
                cell.textView.text = StaticStrings.EmptySection
            }
            
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            cell.viewButton.addTarget(self, action: #selector(showPhotos), for: .touchUpInside)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! UserCustomTableViewCell
            cell.label?.text = StaticStrings.headlines[indexPath.row].title
            cell.textView?.text = StaticStrings.headlines[indexPath.row].text
            cell.backgroundColor = UIColor.brown
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
            
        }
    }
}




