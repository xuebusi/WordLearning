//
//  WordItem.swift
//  WordLearning
//
//  Created by link on 2025/3/30.
//

import SwiftUI

struct WordItem: Identifiable, Codable {
    let id = UUID()
    let english: String
    let chinese: String
    let pronunciation: String
    
    enum CodingKeys: String, CodingKey {
        case english, chinese, pronunciation
    }
}

let sampleWords = [
    WordItem(english: "Apple", chinese: "苹果", pronunciation: "ˈæpəl"),
    WordItem(english: "Banana", chinese: "香蕉", pronunciation: "bəˈnɑːnə"),
    WordItem(english: "Orange", chinese: "橙子", pronunciation: "ˈɒrɪndʒ"),
    WordItem(english: "Grape", chinese: "葡萄", pronunciation: "ɡreɪp"),
    WordItem(english: "Watermelon", chinese: "西瓜", pronunciation: "ˈwɔːtəmelən"),
    WordItem(english: "Strawberry", chinese: "草莓", pronunciation: "ˈstrɔːbəri"),
    WordItem(english: "Pineapple", chinese: "菠萝", pronunciation: "ˈpaɪnæpl"),
    WordItem(english: "Peach", chinese: "桃子", pronunciation: "piːtʃ"),
    WordItem(english: "Pear", chinese: "梨", pronunciation: "peər"),
    WordItem(english: "Mango", chinese: "芒果", pronunciation: "ˈmæŋɡoʊ")
]
