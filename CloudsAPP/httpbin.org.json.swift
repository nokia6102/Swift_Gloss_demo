import Foundation

//宣告 struct 及使用名稱，定義用來存放 JSON 內容的變數
struct HttpbinOrgJson {
    
    let origin: String
    let url: String
    
//    init() {//會改寫自動產生的建構子 影響使用
//        self.origin = "內部設定初始值"
//        self.url = "內部設定初始值"
//    }
}

extension HttpbinOrgJson {
    
    init() {//寫在這就不會影響
        self.origin = "內部設定初始值"
        self.url = "內部設定初始值"
    }
}

