import Foundation
import Alamofire//需要在這用到網路傳輸套件的功能
import Gloss

struct ApiGithubComJson {
    
    let id: Int
    let name: String
    let owner:ApiGithubComJsonOwner
}

struct ApiGithubComJsonOwner {
    
   let login: String
   let id: Int
   let site_admin: Bool
}

struct ApiGithubComJsonGloss : Decodable
{
    
    let id: Int?
    let name: String?
    let owner: ApiGithubComOwnerJsonGloss?
    
    init?(json: JSON)
    {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.owner = "owner" <~~ json
    }
    
}

struct ApiGithubComOwnerJsonGloss: Decodable{
    let login: String?
    let id: Int?
    let site_admin:Bool?
    init?(json: JSON) {
        self.login = "login" <~~ json
        self.id = "id" <~~ json
        self.site_admin = "site_admin" <~~ json
    }
}
extension ApiGithubComJson {//傳入 dictionary 解出我們要的東西
    
//    init?(dictionaryInput: [String: Any]) {
//        guard let id = dictionaryInput["id"] as? Int,
//            let name = dictionaryInput["name"] as? String else {
//                return nil
//        }
//        
//        guard let dictionaryOwner = dictionaryInput["owner"] as? [String: Any],
//            let login = dictionaryOwner["login"] as? String,
//            let owner_id = dictionaryOwner["id"] as? Int,
//            let site_admin = dictionaryOwner["site_admin"] as? Bool else {
//                return nil
//        }
//        
//        self.id = id
//        self.name = name
//        self.owner = (login, owner_id, site_admin)
//     
//    }
}

extension ApiGithubComJson {
    
    //需要定義成 static 才能在物件還沒初始化時，就可以使用 fetch() 這個方法
    //定義 completion handlers 來傳送資料，定義要傳送一種型態的陣列，無返回值
    //宣告 @esacping 才能將資料傳出
    static func fetch(completion: @escaping ([ApiGithubComJsonGloss]) -> Void) {
        request("https://api.github.com/users/octocat/repos").responseJSON { response in
            
            var dataTransfer: [ApiGithubComJsonGloss] = []//先把資料放在這，完成後再傳出去
            
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
                
                guard let jsonParsingGloss = ApiGithubComJsonGloss(json: dictionary) else {
                    return
                }
                
                dataTransfer.append(jsonParsingGloss)
//                print (jsonParsingGloss)
                
//                //在初始化時，使用上面定對的 init 來解我們傳入的 dictionary
//                guard let apiGithubComJson = ApiGithubComJson(dictionaryInput: dictionary) else {
//                    return
//                }
//                
//                print(apiGithubComJson)//印出物件內容
//                dataTransfer.append(apiGithubComJson)//把資料放到要傳送出去的陣列中
//                print("fetch() 完成")//在執行 completion 之前
            }
            
                 completion(dataTransfer)//執行定義好的 completion handler 將資料傳出
        }
    }
}

