//
//  AnswerButton.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct AnswerButton: View {
    let text: String
    let tailIcon: String?
    let isSelected: Bool
    let isCorrect: Bool?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            OptionView(text, tint, tailIcon)
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
    
    private var tint: Color {
        if isSelected {
            return isCorrect == true ? .green : .red
        }
        return .gray
    }
}

struct OptionView: View {
    let option: String
    let tint: Color
    let tailIcon: String?
    
    init(_ option: String, _ tint: Color, _ tailImage: String?) {
        self.option = option
        self.tint = tint
        self.tailIcon = tailImage
    }
    
    var body: some View {
        HStack {
            Text(option)
            Spacer()
            if let tailIcon {
                Image(systemName: tailIcon)
            }
        }
        .foregroundColor(tint)
        .padding(.horizontal,15)
        .padding(.vertical,20)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(tint.opacity(0.15))
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(tint.opacity(tint == .gray ? 0.15 : 1),lineWidth: 2)
                }
        }
    }
}
