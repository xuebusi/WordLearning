//
//  WordLearningApp.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

// 更新App文件
@main
struct WordLearningApp: App {
    @State private var currentMode = 0
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Picker("选择模式", selection: $currentMode) {
                    Text("英→中").tag(0)
                    Text("中→英").tag(1)
                    Text("听音→中").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Group {
                    switch currentMode {
                    case 0:
                        WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
                    case 1:
                        ChineseToEnglishView(viewModel: ChineseToEnglishViewModel(wordList: sampleWords))
                    case 2:
                        PronunciationToChineseView(viewModel: PronunciationToChineseViewModel(wordList: sampleWords))
                    default:
                        WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
                    }
                }
                .animation(.easeInOut, value: currentMode)
            }
        }
    }
}
