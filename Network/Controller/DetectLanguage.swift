//
//  DetectLanguage.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
import Alamofire

class DetectLanguage {
    func detectLangs(_ papago: Papago, _ vc: VocaViewController) {
        let url = "https://openapi.naver.com/v1/papago/detectLangs"
        let clientID = "XVbBUYPgEcZGxSKNxtJz"
        let clientSecret = "w6YQ0DlYzW"
        
        // POST 로 보낼 정보
        let text = papago.readBefore()
        let params : Parameters = [
            "query" : text
        ]
        
        var header = HTTPHeaders()
        header.add(name: "X-Naver-Client-Id", value: clientID)
        header.add(name: "X-Naver-Client-Secret", value: clientSecret)

        
        AF.request(
                    url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: params, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).validate(statusCode: 200..<300)
            .responseDecodable(of: Language.self) { response in
                switch response.result {
                case .success(let response):
                    if let language = response.langCode {
                        print("언어 감지 :: ", language)
                        papago.updateBeforeLanguage(language)
                        print(papago.readBeforeLanguage())
                        vc.detect()
                    }
                case .failure(let err):
                    print("에 러 :: ", err.localizedDescription)
                }
            }
    }
    
}
