//
//  ChineseToPronunciationView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct ChineseToPronunciationView: View {
    @StateObject var viewModel: ChineseToPronunciationViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text("根据中文选择正确的发音")
                .font(.title2)
                .padding()
            
            HStack {
                Text(viewModel.currentWord.chinese)
                    .font(.largeTitle.bold())
                
                Button(action: {
                    viewModel.playCorrectPronunciation()
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.headline)
                        .foregroundColor(viewModel.isAnswerCorrect == nil ? .gray : .purple)
                        .padding()
                        .background(
                            Circle().fill(viewModel.isAnswerCorrect == nil ? .gray.opacity(0.1) : .purple.opacity(0.1))
                        )
                }
                .disabled(viewModel.isAnswerCorrect == nil)
            }
            .padding()
            
            VStack(spacing: 15) {
                ForEach(viewModel.options) { option in
                    AnswerButton(
                        text: option.english,
                        tailIcon: "speaker.wave.2.fill",
                        isSelected: viewModel.selectedAnswer?.id == option.id,
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
    }
}

#Preview {
    ChineseToPronunciationView(viewModel: ChineseToPronunciationViewModel(wordList: sampleWords))
}
