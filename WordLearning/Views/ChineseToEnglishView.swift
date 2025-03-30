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
        VStack(spacing: 15) {
            Text("选择正确的英文单词")
                .font(.title2)
                .padding()
            
            Text(viewModel.currentWord.chinese)
                .font(.largeTitle.bold())
            
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
    }
}

#Preview {
    ChineseToEnglishView(viewModel: ChineseToEnglishViewModel(wordList: sampleWords))
}
