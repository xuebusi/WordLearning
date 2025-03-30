//
//  ChineseToEnglishView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct ChineseToEnglishView: View {
    @StateObject var viewModel: ChineseToEnglishViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("选择正确的英文单词")
                .font(.title)
                .padding()
            
            Text(viewModel.currentWord.chinese)
                .font(.system(size: 32, weight: .bold))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            
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
            
            if viewModel.isAnswerCorrect != nil {
                Button(action: {
                    viewModel.generateQuestion()
                }) {
                    Text("下一题")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ChineseToEnglishView(viewModel: ChineseToEnglishViewModel(wordList: sampleWords))
}
