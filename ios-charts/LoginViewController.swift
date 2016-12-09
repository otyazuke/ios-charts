//
//  LoginViewController.swift
//  ios-charts
//
//  Created by tsuruda_takuya on 2016/12/04.
//  Copyright © 2016年 Takuya Tsuruda. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "login"
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                                              message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
                self.performSegue(withIdentifier: "toChart", sender: session)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let session = sender as? TWTRSession
        let dest = segue.destination as! ViewController
        dest.userId = session?.userID
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
