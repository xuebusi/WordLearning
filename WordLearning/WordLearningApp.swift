//
//  WordLearningApp.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

@main
struct WordLearningApp: App {
    @State private var currentMode = 0
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Picker("选择模式", selection: $currentMode) {
                    Text("英→中").tag(0)
                    Text("中→英").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if currentMode == 0 {
                    WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
                } else {
                    ChineseToEnglishView(viewModel: ChineseToEnglishViewModel(wordList: sampleWords))
                }
            }
        }
    }
}
