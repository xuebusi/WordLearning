//
//  SpellingQuizViewModel.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

class SpellingQuizViewModel: ObservableObject {
    @Published var currentWord: WordItem
    @Published var userInput: String = ""
    @Published var isAnswerCorrect: Bool?
    @Published var showHint: Bool = false
    @Published var attempts: Int = 0
    
    private let wordList: [WordItem]
    private var usedIndices: Set<Int> = []
    
    init(wordList: [WordItem]) {
        self.wordList = wordList
        self.currentWord = wordList[0]
    }
    
    func generateQuestion() {
        // 随机选择一个单词
        let randomIndex = getRandomUnusedIndex()
        currentWord = wordList[randomIndex]
        usedIndices.insert(randomIndex)
        
        // 重置状态
        userInput = ""
        isAnswerCorrect = nil
        showHint = false
        attempts = 0
    }
    
    func checkAnswer() {
        attempts += 1
        
        // 标准化比较（忽略大小写和空格）
        let normalizedInput = userInput.trimmingCharacters(in: .whitespaces).lowercased()
        let normalizedAnswer = currentWord.english.lowercased()
        
        isAnswerCorrect = normalizedInput == normalizedAnswer
        
        // 如果第一次尝试错误，显示提示
        if !(isAnswerCorrect ?? false) && attempts == 1 {
            showHint = true
        }
    }
    
    func getHint() -> String {
        let word = currentWord.english
        guard word.count > 2 else { return word }
        
        let firstLetter = String(word.prefix(1))
        let lastLetter = String(word.suffix(1))
        let middlePlaceholder = String(repeating: "_", count: word.count - 2)
        
        return firstLetter + middlePlaceholder + lastLetter
    }
    
    private func getRandomUnusedIndex() -> Int {
        if usedIndices.count == wordList.count {
            usedIndices = []
        }
        
        var randomIndex: Int
        repeat {
            randomIndex = Int.random(in: 0..<wordList.count)
        } while usedIndices.contains(randomIndex)
        
        return randomIndex
    }
}
