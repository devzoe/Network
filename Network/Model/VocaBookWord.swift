//
//  vocaBookWord.swift
//  Network
//
//  Created by 남경민 on 2022/12/23.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class VocaBookService {
    // 싱글톤
    static let shared = VocaBookService()
    private var wordList: [VocaBookWord] = []
    // count
    var count: Int { self.wordList.count }
    
    init() {
                
    }
    
    public func remove() {
        wordList = []
    }

    
    // Create
    public func add( _ word: String, _ partOfSpeech: String, _ definition: String) {
        self.wordList.append(VocaBookWord(word: word, partOfSpeech: partOfSpeech, definition: definition))
    }
    
    // Read
    public func read(at: Int) -> VocaBookWord {
        return wordList[at]
    }
    public func readAll() -> [VocaBookWord]{
        return wordList
    }
    
    // Update
    public func update(at: Int, newValue: VocaBookWord) {
        wordList[at] = newValue
    }
    
    
    // Delete
    public func delete(at: Int) {
        wordList.remove(at: at)
    }
}

struct VocaBookWord {

    var word: String
    var partOfSpeech: String
    var definition: String
    
}

