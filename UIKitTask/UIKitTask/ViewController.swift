//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        myWebView.scalesPageToFit = true
        
        //MARK: - URL/PDF
        
        if let urlPDF = Bundle.main.url(forResource: "Matt_Neuburg_iOS_15", withExtension: "pdf") {
            let request = URLRequest(url: urlPDF)
            myWebView.loadRequest(request)
        }
        
     /*   if let myUrl = URL(string: "https://habr.com") {
            let request = URLRequest(url: myUrl)
            print(myUrl.port ?? myUrl, myUrl.scheme ?? myUrl, myUrl.baseURL ?? myUrl)
            myWebView.loadRequest(request)
        }
      */
    }
    
    //MARK: - UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.goBackItem.isEnabled = false
        self.goForwardItem.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if myWebView.canGoBack {
            self.goBackItem.isEnabled = true
        } else if myWebView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("shouldStartLoadWith = ", request)
        return true
    }
    
    //MARK: - Action
    
    @IBAction func goBackAction(_ sender: Any) {
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if myWebView.canGoForward {
            myWebView.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        myWebView.reload()
    }
}

