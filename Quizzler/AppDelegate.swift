//
//  AppDelegate.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import mParticle_Apple_SDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print()
      
        //initialize mParticle
        let options = MParticleOptions(key: Secrets().API_KEY,
                                       secret: Secrets().SECRET)
        let identityRequest = MPIdentityApiRequest.withEmptyUser()
        identityRequest.email = "jd@example.com"
        identityRequest.customerId = "2222"
        options.identifyRequest = identityRequest
        options.onIdentifyComplete =  {(result: MPIdentityApiResult?, error: Error?) in
          if (result?.user != nil) {
            result?.user.setUserAttribute("occupation", value: "se")
            result?.user.setUserAttribute("top_region", value: "North America")

          } else {
            //handle failure - see below
          }
        }
      
        MParticle.sharedInstance().start(with: options)

      
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    



}

