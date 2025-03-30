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
                    PronunciationOptionButton(
                        word: option,
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
                    
                    Button(action: {
                        viewModel.generateQuestion()
                    }) {
                        Text("下一题")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ChineseToPronunciationView(viewModel: ChineseToPronunciationViewModel(wordList: sampleWords))
}

struct PronunciationOptionButton: View {
    let word: WordItem
    let isSelected: Bool
    let isCorrect: Bool?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(word.english)
                    .font(.headline)
                Spacer()
                Image(systemName: "speaker.wave.2")
            }
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
