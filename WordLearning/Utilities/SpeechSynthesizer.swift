//
//  SpeechSynthesizer.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import AVFoundation

class SpeechSynthesizer {
    static let shared = SpeechSynthesizer()
    private let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    func speak(_ text: String, language: String = "en-US") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.5
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
}
