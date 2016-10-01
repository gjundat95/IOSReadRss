//
//  DetailsViewController.swift
//  QuizShow
//
//  Created by Tinh Ngo on 9/18/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    var deTitle = String()
    var link = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        LoadingOverlay.show("Loading")
        print(link)
        link = link.validateURL()

        if self.validateUrl(stringURL: link as NSString){
            UIWebView.loadRequest(webView)(NSURLRequest(url: NSURL(string: link)! as URL!) as URLRequest!)
        }
    
    }
    
    func validateUrl (stringURL : NSString) -> Bool {
        let urlRegEx = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&amp;=]*)?"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        
        return predicate.evaluate(with: stringURL)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        LoadingOverlay.hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
