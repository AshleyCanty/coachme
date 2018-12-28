//
//  WriteReviewViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/19/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController {

    @IBOutlet weak var charCount: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here")
        textView.delegate = self as? UITextViewDelegate
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        print("typing started")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        print("typing ended")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
