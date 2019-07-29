//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Jack Dwyer on 7/27/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
  var list = [Question]()
  
  init() {
    
    // Creating a quiz item and appending it to the list
    let item = Question(text: "Allows you to collect data from connected device apps such as Roku, AppleTV, Xbox, and tvOS.", correctAnswer: true)
    
    // Add the Question to the list of questions
    list.append(item)
    
    // skipping one step and just creating the quiz item inside the append function
    list.append(Question(text: "Some integrations are Kaftka, Appnexus, and S3", correctAnswer: true))
    
    list.append(Question(text: "Example SDKs include React Native, Flutter, and Alexa.", correctAnswer: false))
    
    list.append(Question(text: "The User Activity view allows you to see a detailed summary of data associated with a single user. All users can access the User Activity view.", correctAnswer: false))
    
    list.append(Question(text: "The Live Stream is a real time view of data coming in and out of MP. If there are any errors in forwarding event data to a specific integration, an error icon will appear next to the integration message type displaying the reason.", correctAnswer: true))
    
    list.append(Question(text: "CDP stand for Customer Data Platform.", correctAnswer: true))
  }
  
}
