//
//  ViewController.swift
//  Fbandinstaloginpage
//
//  Created by Jomms on 07/01/21.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath:"me", parameters:["fields":"email,name"], tokenString:token, version: nil, httpMethod: .get)
        request.start(completionHandler:{connection,request,error in
            print("\(result)")
        })
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    

    @IBOutlet weak var btn_fb: UIButton!
    @IBOutlet weak var btn_insta: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current,
            !token.isExpired {
            
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath:"me", parameters:["fields":"email,name"], tokenString:token, version: nil, httpMethod: .get)
            request.start(completionHandler:{connection,request,error in
                print("\(token)")
            })
           
        }else{
            
        
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile,email"]
        view.addSubview(loginButton)
        }
    }
    

    @IBAction func btn_fb(_ sender: Any) {
        
        
        
    }
    
    @IBAction func btn_insta(_ sender: Any) {
    }
}

