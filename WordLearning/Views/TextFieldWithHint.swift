//
//  TextFieldWithHint.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct TextFieldWithHint: View {
    let title: String
    @Binding var text: String
    let hint: String
    let isCorrect: Bool?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            ZStack(alignment: .trailing) {
                TextField("", text: $text)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(borderColor, lineWidth: 2)
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                if !text.isEmpty && isCorrect == nil {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing, 8)
                }
            }
            
            if !text.isEmpty && isCorrect == nil {
                Text("提示: \(hint)")
                    .font(.caption)
                    .foregroundColor(.orange)
                    .transition(.opacity)
            }
        }
    }
    
    private var borderColor: Color {
        if let isCorrect = isCorrect {
            return isCorrect ? .green : .red
        }
        return .gray
    }
}
