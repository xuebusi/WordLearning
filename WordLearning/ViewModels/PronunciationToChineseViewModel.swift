//
//  PronunciationToChineseViewModel.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

class PronunciationToChineseViewModel: ObservableObject {
    @Published var currentWord: WordItem
    @Published var options: [String] = []
    @Published var selectedAnswer: String?
    @Published var isAnswerCorrect: Bool?
    
    private let wordList: [WordItem]
    private var usedIndices: Set<Int> = []
    private let speechSynthesizer = SpeechSynthesizer.shared
    
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
        var allOptions = [currentWord.chinese]
        let otherWords = wordList.filter { $0.id != currentWord.id }.shuffled()
        
        for word in otherWords.prefix(3) {
            allOptions.append(word.chinese)
        }
        
        options = allOptions.shuffled()
        selectedAnswer = nil
        isAnswerCorrect = nil
        
        // 播放单词发音
        speakWord()
    }
    
    func speakWord() {
        speechSynthesizer.speak(currentWord.english)
    }
    
    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        isAnswerCorrect = (answer == currentWord.chinese)
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
