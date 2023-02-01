//
//  SearchMeaning.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
import Alamofire

class SearchMeaning {
    func searchMeaning(_ wordService: WordService, _ text: String, _ language: String, _ vc : SearchWordViewController) {
        //let wordService : WordService = WordService()
        let naverPapago = NaverPapago()
        var url = "https://api.dictionaryapi.dev/api/v2/entries/"
        let langs = language + "/"
        let text = text
        
        
        url += langs + text
        
        print(url)
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable (of: WordDTO.self) { response in
                switch response.result {
                case .success(let response):
                    print("검색 :: ", response)
                    
                    for (index, value) in response.enumerated() {
                        var i = 0
                        while ( i < value.meanings.count ) {
                            let partOfSpeech = value.meanings[i]?.partOfSpeech
                            
                            var j = 0
                            while ( j < value.meanings[i]?.definitions.count ?? 0){
                                if let definition = value.meanings[i]?.definitions[j]?.definition {
                                    if value.meanings[i]?.definitions[j]?.example != nil {
                                        let example =  value.meanings[i]?.definitions[j]?.example
                                        wordService.add(language, text, partOfSpeech ?? "", definition, example ?? "")
                                    } else {
                                        wordService.add(language, text, partOfSpeech ?? "", definition, "")
                                    }
                                }
                                j += 1
                            }
                            i += 1
                            
                        }
                    }
                    print(wordService.readAll())
                    print("--------word collection--------------")
                    
                    for (index,value) in wordService.readAll().enumerated() {
                        let p = value.partOfSpeech
                        let d = value.definition
                        naverPapago.callEnToKoURL(index, wordService, p, "p")
                        naverPapago.callEnToKoURL(index, wordService, d, "d")
                       // wordService.update(at: index, PnewValue: translatedP, DnewValue: translatedD)
                        
                    }
                    vc.getWordTable()
                    
                    
                case .failure(let err):
                    print("에 러 :: ", err)
                }
            }
        
    }
}
