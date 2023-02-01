//
//  NaverLogin.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
import Alamofire
import NaverThirdPartyLogin

class NaverLogin {
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    private var user = User.shard

    func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
          return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        // Method : GET
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { [self] response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            print("name : \(name)")
            print("email : \(email)")
            
            print("name : \(user.readName())")
            print("email : \(user.readEmail())")
            user.updateName(name)
            user.updateEmail(email)
            print("name : \(user.readName())")
            print("email : \(user.readEmail())")
        }
    }
}
