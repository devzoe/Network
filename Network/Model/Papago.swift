//
//  Papago.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
// MARK: - PapagoDTO
struct PapagoDTO: Decodable {
    let message: Message
}

// MARK: - Message
struct Message: Decodable {
    let type, service, version: String
    let result: Result

    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case service = "@service"
        case version = "@version"
        case result
    }
}

// MARK: - Result
struct Result: Decodable {
    let srcLangType, tarLangType, translatedText: String?
}

// MARK: - Language
struct Language: Decodable {
    let langCode: String?
}


// MARK: - Papago
class Papago {
    private var beforeLanguage: String
    private var afterLanguage: String
    private var beforeTranslate: String
    private var afterTranslate: String

    init() {
        self.beforeLanguage = ""
        self.afterLanguage = ""
        self.beforeTranslate = ""
        self.afterTranslate = ""
    }
    func readBeforeLanguage() -> String {
        return self.beforeLanguage
    }
    func readAfterLanguage() -> String {
        return self.afterLanguage
    }
    func readBefore() -> String {
        return self.beforeTranslate
    }
    func readAfter() -> String {
        return self.afterTranslate
    }
    func updateBeforeLanguage(_ beforeLanguage: String) {
        self.beforeLanguage = beforeLanguage
    }
    func updateAfterLaunguage(_ afterLanguage: String) {
        self.afterLanguage = afterLanguage
    }
    func updateBefore(_ beforeTranslate: String) {
        self.beforeTranslate = beforeTranslate
    }
    func updateAfter(_ afterTranslate: String) {
        self.afterTranslate = afterTranslate
    }
}
