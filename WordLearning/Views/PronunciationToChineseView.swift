//
//  PronunciationToChineseView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct PronunciationToChineseView: View {
    @StateObject var viewModel: PronunciationToChineseViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("听发音选择正确的中文翻译")
                .font(.title)
                .padding()
            
            Button(action: {
                viewModel.speakWord()
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.purple)
                    .padding()
                    .background(Circle().fill(Color.purple.opacity(0.1)))
            }
            .padding()
            
            Text("听到的单词是...")
                .font(.headline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 15) {
                ForEach(viewModel.options, id: \.self) { option in
                    AnswerButton(
                        text: option,
                        tailIcon: "speaker.wave.2.fill",
                        isSelected: viewModel.selectedAnswer == option,
                        isCorrect: viewModel.isAnswerCorrect,
                        action: {
                            viewModel.selectAnswer(option)
                        }
                    )
                }
            }
            .padding(.horizontal)
            
            if viewModel.isAnswerCorrect != nil {
                CustomButton(title: "下一题", onClick: {
                    viewModel.generateQuestion()
                })
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    PronunciationToChineseView(viewModel: PronunciationToChineseViewModel(wordList: sampleWords))
}
