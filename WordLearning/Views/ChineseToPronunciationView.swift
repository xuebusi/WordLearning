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
        VStack(spacing: 20) {
            Text("根据中文选择正确的发音")
                .font(.title)
                .padding()
            
            Text(viewModel.currentWord.chinese)
                .font(.system(size: 32, weight: .bold))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            
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
            
            if viewModel.isAnswerCorrect != nil {
                VStack(spacing: 15) {
                    Button(action: {
                        viewModel.playCorrectPronunciation()
                    }) {
                        HStack {
                            Image(systemName: "speaker.wave.2.fill")
                            Text("播放正确发音")
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.2))
                        .foregroundColor(.green)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    CustomButton(title: "下一题", onClick: {
                        viewModel.generateQuestion()
                    })
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ChineseToPronunciationView(viewModel: ChineseToPronunciationViewModel(wordList: sampleWords))
}
