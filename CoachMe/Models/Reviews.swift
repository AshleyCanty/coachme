//
//  Reviews.swift
//  CoachMe
//
//  Created by ashley canty on 12/17/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class Reviews {
    var authorName: String
    var authorId: String
    var userTargetName: String
    var userTargetId: String
    var reviewText: String
    var reviewId: String
    var rating: Double
    var timeStamp: String
    var timeLapsed: String
    
    init?(authorName: String, authorId: String, userTargetName: String, userTargetId: String, reviewText: String, reviewId: String, rating: Double, timeStamp: String, timeLapsed: String) {
        self.authorName = authorName
        self.authorId = authorId
        self.userTargetName = userTargetName
        self.userTargetId = userTargetId
        self.reviewText = reviewText
        self.reviewId = reviewId
        self.rating = rating
        self.timeStamp = timeStamp
        self.timeLapsed = timeLapsed
    }
    
}
