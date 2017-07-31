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
            
            guard let origin = dictionary["origin"] as? String else {
                return
            }
            
            print("origin: \(origin)")
            
            guard let url = dictionary["url"] as? String else {
                return
            }
            
            print("url: \(url)")
            
            //在初始化物件時，輸入物件變數用的資料
            let httpbinOrgJson = HttpbinOrgJson(origin: origin, url: url)
            print(httpbinOrgJson)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

