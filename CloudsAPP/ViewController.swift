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
        
        Alamofire.request("https://api.github.com/users/octocat/repos").responseJSON { response in

            //更符合內容的命名變數名稱為 result_value
            guard let result_value = response.result.value,
                let array = result_value as? [Any]//將 result_value 解讀為 任何型態 的陣列
                else {
                    return
            }
            
            for JSON_OBJECT in array {//將陣列中的 每1個 JSON 物件 做解析
                guard let dictionary = JSON_OBJECT as? [String: Any]//將 JSON 物件轉成 key-value 陣列
                    else {
                        return
                }
                    
                if let value = dictionary["id"] as? Int {
                    print("id: \(value)")
                }
                
                if let value = dictionary["name"] as? String {
                    print("name: \(value)")
                }
                
                if let value = dictionary["private"] as? Bool {
                    print("private: \(value)")
                }
                
                if let value = dictionary["homepage"] as? String {
                    print("homepage: \(value)")
                } else {
                    print("homepage: null")//不知道原始格式之下的處理
                }
            }
        }
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request as Any)
//            print(response.response as Any)
//            print(response.data as Any)
//            print(response.result)
            
//            if let ARRAY = response.result.value {
//                print("準備印出 result 中的資料")
//                print(ARRAY)
//            }
            
            if let JSON = response.result.value {
                if let dictionary = JSON as? [String: Any] {//將 JSON 物件，轉成 dictionary 的 key:value 的陣列
                    
                    if let value = dictionary["origin"] as? String {
                        print("解出 key 為 origin 的值")
                        print(value)
                    }
                    
                    if let value = dictionary["url"] as? String {
                        print("解出 key 為 url 的值")
                        print(value)
                    }
                    
                    //要當做 JSON 物件再解一次
                    if let headers_dictionary = dictionary["headers"] as? [String: Any] {
                        for (key, value) in headers_dictionary {
                            if let value_string = value as? String {
                                print(key + ":" + value_string)
                            }
                        }
                    }
                    
                    //不用解了，因為沒東西
                    if let value = dictionary["args"] as? String {//解不出來，因為不是 String
                        print("解出 key 為 args 的值")
                        print(value)
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

