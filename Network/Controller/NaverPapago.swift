//
//  NaverPapago.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
import Alamofire

class NaverPapago {
    func callKoToEnURL(_ papago: Papago, _ vc: VocaViewController) {
   
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let clientID = "gvRGauMEqUEiQBCx2lJ5"
        let clientSecret = "HqujrFE3vz"
        
        // POST 로 보낼 정보
        let text = papago.readBefore()
        let params : Parameters = [
            "source" : "ko",
            "target" : "en",
            "text" : text
        ]
        
        var header = HTTPHeaders()
        header.add(name: "X-Naver-Client-Id", value: clientID)
        header.add(name: "X-Naver-Client-Secret", value: clientSecret)
        header.add(name: "Content-Length", value: String(params.count))
        
        AF.request(
                    url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: params, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).validate(statusCode: 200..<300)
            .responseDecodable(of: PapagoDTO.self) { response in
                switch response.result {
                case .success(let response):
                    if let translatedText = response.message.result.translatedText {
                        print("응답 데이터 :: ", translatedText)
                        papago.updateAfter(translatedText)
                        print(papago.readAfter())
                        vc.translatedText()
                    }
                case .failure(let err):
                    print("에 러 :: ", err.localizedDescription)
                }
            }
    }
    
    func callEnToKoURL(_ papago: Papago, _ vc: VocaViewController) {
   
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let clientID = "gvRGauMEqUEiQBCx2lJ5"
        let clientSecret = "HqujrFE3vz"
        
        // POST 로 보낼 정보
        let text = papago.readBefore()
        let params : Parameters = [
            "source" : "en",
            "target" : "ko",
            "text" : text
        ]
        
        var header = HTTPHeaders()
        header.add(name: "X-Naver-Client-Id", value: clientID)
        header.add(name: "X-Naver-Client-Secret", value: clientSecret)
        header.add(name: "Content-Length", value: String(params.count))
        
        AF.request(
                    url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: params, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).validate(statusCode: 200..<300)
            .responseDecodable(of: PapagoDTO.self) { response in
                switch response.result {
                case .success(let response):
                    if let translatedText = response.message.result.translatedText {
                        print("응답 데이터 :: ", translatedText)
                        papago.updateAfter(translatedText)
                        print(papago.readAfter())
                        vc.translatedText()
                    }
                case .failure(let err):
                    print("에 러 :: ", err.localizedDescription)
                }
            }
    }
    
    func callEnToKoURL(_ index: Int, _ wordService: WordService, _ text: String, _ check: String) {
      
   
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let clientID = "gvRGauMEqUEiQBCx2lJ5"
        let clientSecret = "HqujrFE3vz"
        
        // POST 로 보낼 정보
        let text = text
        let params : Parameters = [
            "source" : "en",
            "target" : "ko",
            "text" : text
        ]
        
        var header = HTTPHeaders()
        header.add(name: "X-Naver-Client-Id", value: clientID)
        header.add(name: "X-Naver-Client-Secret", value: clientSecret)
        header.add(name: "Content-Length", value: String(params.count))
        
        AF.request(
                    url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: params, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).validate(statusCode: 200..<300)
            .responseDecodable(of: PapagoDTO.self) { response in
                switch response.result {
                case .success(let response):
                    if let translatedText = response.message.result.translatedText {
                        print("응답 데이터 :: ", translatedText)
                        if (check == "p") {
                            wordService.update(at: index, PnewValue: translatedText)
                        } else {
                            wordService.update(at: index, DnewValue: translatedText)
                        }
                    }
                case .failure(let err):
                    print("에 러 :: ", err.localizedDescription)
                }
            }
     
    }
}

/* url session
    func callPapago(_ papago: Papago){
        
        let text = papago.readBefore()
        let param = "source=ko&target=en&text=\(text)"
        let paramData = param.data(using: .utf8)
        let Naver_URL = URL(string: "https://openapi.naver.com/v1/papago/n2mt")
        
        let ClientID = "gvRGauMEqUEiQBCx2lJ5"
        let ClientSecret = "HqujrFE3vz"
        
        //Request
        var request = URLRequest(url: Naver_URL!)
        request.httpMethod = "POST"
        request.addValue(ClientID,forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(ClientSecret,forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = paramData
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        
        //Session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        //Task
        let task = session.dataTask(with: request) { (data, response, error) in
            //통신 성공
            if let data = data {
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                print(str)
                papago.updateAfter(str)
                
            }
            //통신 실패
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
 */
