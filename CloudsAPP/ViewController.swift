//
//  ViewController.swift
//  CloudsAPP
//
//  Created by mike on 2017/7/24.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class ViewController: UIViewController {
    var apiGithubComJsons: [ApiGithubComJsonGloss] = []//用來放 completion 傳來的資料
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //希望重構程式到用以下一行即可處理 JSON 的取得
        //使用這個方法時，其實物件還沒初始化
        ApiGithubComJson.fetch(){ dataTransfer in//completion 將資料傳過來
            self.apiGithubComJsons = dataTransfer//將資料放在這個類別中
            print("fetch() 完成後")
            print(self.apiGithubComJsons)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

