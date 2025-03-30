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
        VStack(spacing: 20) {
            Text("选择正确的中文翻译")
                .font(.title)
                .padding()
            
            Text(viewModel.currentWord.english)
                .font(.system(size: 32, weight: .bold))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
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
            .padding(15)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white)
            }
            
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
    WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
}
