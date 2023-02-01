//
//  Word.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import Foundation
/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class WordService {
    // 싱글톤
    //static let shared = WordService()
    private var wordList: [Word] = []
    // count
    var count: Int { self.wordList.count }
    
    init() {
                
    }
    
    public func remove() {
        wordList = []
    }

    
    // Create
    public func add(_ language: String, _ word: String, _ partOfSpeech: String, _ definition: String, _ example: String) {
        self.wordList.append(Word(languge: language, word: word, partOfSpeech: partOfSpeech, definition: definition, example: example))
    }
    
    // Read
    public func read(at: Int) -> Word {
        return wordList[at]
    }
    public func readAll() -> [Word]{
        return wordList
    }
    
    // Update
    public func update(at: Int, newValue: Word) {
        wordList[at] = newValue
    }
    public func update(at: Int, PnewValue: String){
        wordList[at].partOfSpeech = PnewValue
        //wordList[at].definition = DnewValue
    }
    public func update(at: Int, DnewValue: String){
        //wordList[at].partOfSpeech = PnewValue
        wordList[at].definition = DnewValue
    }
    // Delete
    public func delete(at: Int) {
        wordList.remove(at: at)
    }
}
struct Word {
    var languge: String
    var word: String
    var partOfSpeech: String
    var definition: String
    var example: String
}
