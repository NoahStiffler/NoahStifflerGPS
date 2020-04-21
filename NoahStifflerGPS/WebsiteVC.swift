//
//  WebsiteVC.swift
//  NoahStifflerGPS
//
//  Created by Noah Stiffler on 4/21/20.
//  Copyright © 2020 Noah Stiffler. All rights reserved.
//

import UIKit
import WebKit
import MessageUI

class WebsiteVC: UIViewController, MFMessageComposeViewControllerDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    
    
    @IBAction func composeMessage(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        //Intentionally left blank so user can select who they want directly from their contacts
       // composeVC.recipients = [""]
        composeVC.body = "How far are you from the worlds largest toilet? Download and find out! (link to download)"
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        }
        else {
            print("Cannot send message(s).")
        }
        
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    
    }
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let webURL = URL(string:"https://www.appleinsider.com/inside/apple-park")
        let myRequest = URLRequest(url: webURL!)
        webView.load(myRequest)
       
    }
    

    

}
