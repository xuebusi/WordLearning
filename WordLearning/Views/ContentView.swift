//
//  ContentView.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMode = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("选择模式", selection: $currentMode) {
                    ForEach(Mode.allCases.indices, id: \.self) { index in
                        Text(Mode.allCases[index].desc)
                            .tag(Mode.allCases[index].rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                getCardView()
                    .frame(maxHeight: .infinity)
            }
        }
    }
    
    func getCardView() -> some View {
        Group {
            switch currentMode {
            case 0:
                WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
            case 1:
                ChineseToEnglishView(viewModel: ChineseToEnglishViewModel(wordList: sampleWords))
            case 2:
                PronunciationToChineseView(viewModel: PronunciationToChineseViewModel(wordList: sampleWords))
            case 3:
                ChineseToPronunciationView(viewModel: ChineseToPronunciationViewModel(wordList: sampleWords))
            case 4:
                SpellingQuizView(viewModel: SpellingQuizViewModel(wordList: sampleWords))
            default:
                WordQuizView(viewModel: WordQuizViewModel(wordList: sampleWords))
            }
        }
    }
}

enum Mode: Int, CaseIterable {
    case m1 = 0
    case m2 = 1
    case m3 = 2
    case m4 = 3
    case m5 = 4
    
    var desc: String {
        switch self {
        case .m1:
            return "英→中"
        case .m2:
            return "中→英"
        case .m3:
            return "听音→中"
        case .m4:
            return "中→听音"
        case .m5:
            return "拼写"
        }
    }
}

#Preview {
    ContentView()
}
