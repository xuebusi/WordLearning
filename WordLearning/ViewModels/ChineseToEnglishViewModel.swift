//
//  ChineseToEnglishViewModel.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

class ChineseToEnglishViewModel: ObservableObject {
    @Published var currentWord: WordItem
    @Published var options: [String] = []
    @Published var selectedAnswer: String?
    @Published var isAnswerCorrect: Bool?
    
    private let wordList: [WordItem]
    private var usedIndices: Set<Int> = []
    
    init(wordList: [WordItem]) {
        self.wordList = wordList
        self.currentWord = wordList[0]
        generateQuestion()
    }
    
    func generateQuestion() {
        // 随机选择一个单词
        let randomIndex = getRandomUnusedIndex()
        currentWord = wordList[randomIndex]
        usedIndices.insert(randomIndex)
        
        // 生成选项 (正确答案 + 3个干扰项)
        var allOptions = [currentWord.english]
        let otherWords = wordList.filter { $0.id != currentWord.id }.shuffled()
        
        for word in otherWords.prefix(3) {
            allOptions.append(word.english)
        }
        
        options = allOptions.shuffled()
        selectedAnswer = nil
        isAnswerCorrect = nil
    }
    
    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        isAnswerCorrect = (answer == currentWord.english)
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
