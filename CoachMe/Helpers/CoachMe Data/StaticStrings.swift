//
//  StaticStrings.swift
//  CoachMe
//
//  Created by ashley canty on 12/8/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import Foundation

class StaticStrings {
    static let login = "Login"
    static let coachMe = "coachMe"
    static let mentor = "Mentor"
    static let mentee = "Mentee"
    static let selectRole = "Select a role"
    static let AlmostThere = "Almost there..."
    static let bio = "Bio"
    static let emptySection = "This user has not yet written here."
    static let name = "name"
    static let email = "Email address"
    static let number = "Phone number"
    static let username = "Username"
    static let password = "Password"
    static let confirmPassword = "Confirm password"
    static let next = "Continue"
    static let register = "Register"
    static let addPhoto = "Add a photo"
    static let LeaveReview = "Leave a review (optional)."
    static let SeeReviewsButton = "See all reviews"
    static let Home = "Home"
    static let Inbox = "Inbox"
    static let Saved = "Saved"
    static let Account = "Account"
    static let UserProfileImages = ["angela-pushup", "reese", "coach3", "tyson", "coach1", "usher", "coach2", "tyson-situp", "tyson-squat"]
    
    
    static let headlines = [
        Headline(title: "About me", text: "I am not what I ought to be, I am not what I want to be, I am not what I hope to be in another world, but still, I am not what I once used to be, and by the grace of God I am what I am."),
        Headline(title: "Joey Rockout", text: "I am not what I ought to be, I am not what I want to be, I am not what I hope to be in another world, but still, I am not what I once used to be, and by the grace of God I am what I am."),
        Headline(title: "Photos", text: "I am not what I ought to be, I am not what I want to be, I am not what I hope to be in another world, but still, I am not what I once used to be, and by the grace of God I am what I am.r")
    ]
    
    
    static var ServiceCard = [
        ServiceCardInfo(title: "Math", rate: "325"),
        ServiceCardInfo(title: "Throwing", rate: "50")
    ]
    
    static let SearchCard = [
        SearchResultsCard(image: "coach1", firstname: "Tariq", lastname: "Domas", averageRating: "7.7", location: "Bronx, NY", lastActive: "Last active 1hrs ago", baseRate: "65"),
        SearchResultsCard(image: "coach2", firstname: "Joel", lastname: "Souey", averageRating: "8.7", location: "Brooklyn, NY", lastActive: "Last active 3 days ago", baseRate: "50"),
        SearchResultsCard(image: "usher", firstname: "Usher", lastname: "Raymond", averageRating: "9.0", location: "Los Angelos, CA", lastActive: "Last active 10 days ago", baseRate: "14"),
        SearchResultsCard(image: "coach3", firstname: "Huey", lastname: "Nougat", averageRating: "8.7", location: "Atlantic City, NJ", lastActive: "Last active 4hrs ago", baseRate: "25")
    ]
    
    static let MessageCards = [
        MessageCard(userImage: "coach2", username: "Joel Sally", message: "I ahve about three card to go", timestamp: "03:26", messageCounter: "2"),
        MessageCard(userImage: "coach3", username: "Eazy-E", message: "Yeah homie, I'll be there soon", timestamp: "01:44", messageCounter: "1"),
        MessageCard(userImage: "coach1", username: "Riding Hood", message: "I got three wolves at the house.", timestamp: "03:23", messageCounter: "1"),
        MessageCard(userImage: "usher", username: "Inspektah Deck", message: "Who ate meff's veggie sandwhich, he's mad", timestamp: "11:30", messageCounter: "0")
        
    ]
    

}

class NavigationTitles {
    static let Reviews = "Reviews"
    static let Profile = "Profile"
    static let Login = "Login"
    static let Signup = "Sign up"
}

class UserDefaultKeys {
    static let Tab = "tab"
    static let Status = "status"
    
}

class LinkTitles {
    static let SeeReviewsButton = "See all reviews"
}
