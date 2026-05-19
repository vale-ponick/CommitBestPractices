//
//  main.swift
//  CommitBestPractices
//
//  Created by Валерия Пономарева on 19.05.2026.
//

import Foundation

// MARK: - 1️⃣ Data
struct Commit {
    let name: String
    let description: String
    let example: [String]
    let emoji: String
    let category: [String]
    let whenToUse: String
}

enum Difficulty {
    case easy
    case medium
    case hard
}

// MARK - 2️⃣ Данные (массив с примерами)

var commits: [Commit] = [
    Commit(
        name: "feat",
        description: "new functionality",
        example: ["feat: add ToDo command", "✨ feat: add Commit struct and first data sample"],
        emoji: "✨",
        category: ["basic", "feature"],
        whenToUse: "when add new command or opportunity"
        )
    ]
