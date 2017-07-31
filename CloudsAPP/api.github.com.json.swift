import Foundation
import Alamofire//需要在這用到網路傳輸套件的功能

struct ApiGithubComJson {
    
    let id: Int
    let name: String
}

extension ApiGithubComJson {//傳入 dictionary 解出我們要的東西
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
    }
}

extension ApiGithubComJson {
    
    //需要定義成 static 才能在物件還沒初始化時，就可以使用 fetch() 這個方法
    static func fetch() {
        request("https://api.github.com/users/octocat/repos").responseJSON { response in
            
            //跟前面所教的一樣，解最外面的 []
            guard let result_value = response.result.value,
                let array = result_value as? [Any] else {
                    return
            }
            
            //把每個 JSON 物件從 陣列 中解出
            for JSON_OBJECT in array {
                guard let dictionary = JSON_OBJECT as? [String: Any] else {
                    return
                }
                
                //在初始化時，使用上面定對的 init 來解我們傳入的 dictionary
                guard let apiGithubComJson = ApiGithubComJson(dictionary: dictionary) else {
                    return
                }
                
                print(apiGithubComJson)//印出物件內容
            }
        }
    }
}

