//
//  SpellingQuizView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct SpellingQuizView: View {
    @StateObject var viewModel: SpellingQuizViewModel
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("拼写正确的英文单词")
                .font(.title)
                .padding()
            
            Text(viewModel.currentWord.chinese)
                .font(.system(size: 32, weight: .bold))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.indigo.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextFieldWithHint(
                title: "输入英文单词",
                text: $viewModel.userInput,
                hint: viewModel.getHint(),
                isCorrect: viewModel.isAnswerCorrect
            )
            .padding(.horizontal)
            .focused($isInputFocused)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isInputFocused = true
                }
            }
            
            if viewModel.showHint {
                Text("发音提示: \(viewModel.currentWord.pronunciation)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.top, 5)
            }
            
            if viewModel.isAnswerCorrect == false {
                Text("正确答案: \(viewModel.currentWord.english)")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding(.top, 5)
            }
            
            CustomButton(title: viewModel.isAnswerCorrect == nil ? "提交" : "下一题", onClick: {
                if viewModel.isAnswerCorrect == nil {
                    viewModel.checkAnswer()
                } else {
                    viewModel.generateQuestion()
                }
            })
            .padding(.horizontal)
            .disabled(viewModel.userInput.isEmpty && viewModel.isAnswerCorrect == nil)
        }
        .onSubmit {
            if !viewModel.userInput.isEmpty {
                viewModel.checkAnswer()
            }
        }
    }
    
    private var buttonBackground: Color {
        if viewModel.isAnswerCorrect == nil {
            return viewModel.userInput.isEmpty ? .gray : .indigo
        } else {
            return .indigo
        }
    }
}

#Preview {
    SpellingQuizView(viewModel: SpellingQuizViewModel(wordList: sampleWords))
}
