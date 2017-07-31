//
//  ViewController.swift
//  CloudsAPP
//
//  Created by mike on 2017/7/24.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            
            guard let JSON_OBJECT = response.result.value,
                let dictionary = JSON_OBJECT as? [String: Any]
                else {
                    return
            }
            
            //throw 的呼叫需要加 try
            let httpbinOrgJson3 = try? HttpbinOrgJson(dictionary: dictionary)
            print(httpbinOrgJson3 as Any)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

