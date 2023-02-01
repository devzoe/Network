//
//  User.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation

class User {
    // 싱글톤
    static let shard = User()
    private var name:String
    private var email:String
    
    private init() {
        self.name = ""
        self.email = ""
    }
    
    func updateName(_ name: String) {
        self.name = name
    }
    func updateEmail(_ email: String) {
        self.email = email
    }
    func readName() -> String {
        return self.name
    }
    func readEmail() -> String {
        return self.email
    }
}
