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
            
            VStack(spacing: 15) {
                ForEach(viewModel.options, id: \.self) { option in
                    AnswerButton(
                        text: option,
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
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
        .disabled(isCorrect != nil)
    }
    
    private var backgroundColor: Color {
        if isSelected {
            return isCorrect == true ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
        }
        return Color.clear
    }
    
    private var foregroundColor: Color {
        if isSelected {
            return isCorrect == true ? .green : .red
        }
        return .primary
    }
    
    private var borderColor: Color {
        if isSelected {
            return isCorrect == true ? .green : .red
        }
        return .gray
    }
}
