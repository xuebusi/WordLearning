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
        VStack(spacing: 15) {
            Button(action: {
                viewModel.speakWord()
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding(25)
                    .background(Circle().fill(Color.purple.opacity(0.1)))
            }
            
            VStack(spacing: 15) {
                ForEach(viewModel.options, id: \.self) { option in
                    AnswerButton(
                        text: option,
                        tailIcon: nil,
                        isSelected: viewModel.selectedAnswer == option,
                        isCorrect: viewModel.isAnswerCorrect,
                        action: {
                            viewModel.selectAnswer(option)
                        }
                    )
                }
            }
            .padding(.horizontal)
            CustomButton(title: "下一题", onClick: {
                viewModel.generateQuestion()
            })
            .padding(.horizontal)
            .disabled(viewModel.isAnswerCorrect == nil)
        }
        .navigationTitle("听发音选择正确的中文翻译")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PronunciationToChineseView(viewModel: PronunciationToChineseViewModel(wordList: sampleWords))
}
