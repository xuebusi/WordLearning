//
//  CustomButton.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct CustomButton: View{
    var title: String
    var onClick: ()->()
    
    var body: some View{
        Button {
            onClick()
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .center)
                .padding()
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("OK"))
                }
        }
    }
}

#Preview {
    CustomButton(title: "下一题") {
        print("下一题")
    }
    .padding()
}
