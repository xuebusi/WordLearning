//
//  WordQuizView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct WordQuizView: View {
    @StateObject var viewModel: WordQuizViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text(viewModel.currentWord.english)
                .font(.largeTitle.bold())
                .padding(.vertical)
            
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
            .padding(.horizontal, 15)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white)
            }
            
            CustomButton(title: "下一题", onClick: {
                viewModel.generateQuestion()
            })
            .padding(.horizontal)
            .disabled(viewModel.isAnswerCorrect == nil)
        }
        .navigationTitle("选择正确的中文翻译")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
}
