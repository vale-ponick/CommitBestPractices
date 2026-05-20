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

enum Command: String { // with rawValue
    case list = "list"
    case exit = "exit"
    case game = "game" // add new command for game
}
// MARK - 2️⃣ Данные (массив с примерами)

var commits: [Commit] = [ // массив хранит все коммиты
    Commit(
        name: "feat",
        description: "new functionality",
        example: ["feat: add chore and fix commit types to array", "feat: add Commit struct and first data sample", "feat: add interactive mode with list and exit commands"],
        emoji: "✨",
        category: ["basic", "feature"],
        whenToUse: "when add new command or opportunity"
        ),
    Commit(
        name: "chore",
        description: "maintenance tasks",
        example: ["chore: init CommitBestPractices project", "chore: update dependencies"],
        emoji: "🔧",
        category: ["basic", "maintenance"],
        whenToUse: "when creating project, setup configs, or updating tools"
        ),
    Commit(
        name: "fix",
        description: "bug fix",
        example: ["fix: division by zero error"],
        emoji: "🐛",
        category: ["basic", "bug"],
        whenToUse: "when fixing a bug in working code"
        ),
    Commit(
        name: "docs",
        description: "documentation",
        example: ["docs: add README", "docs: update comments", "docs: add meta-learning section"],
        emoji: "📝",
        category: ["basic", "documentation"],
        whenToUse: "when writing or updating documentation"
        ),
    Commit(
        name: "style",
        description: "code formatting",
        example: ["style: add emojis to print", "style: fix indentation"],
        emoji: "🎨",
        category: ["basic", "formatting"],
        whenToUse: "when changing spaces, indentation, formatting - changes do NOT affect code logic"
        ),
    Commit(
        name: "refactor",
        description: "code improvement without changing behavior",
        example: ["refactor: extract quiz logic to function"],
        emoji: "♻️",
        category: ["advanced", "quality"],
        whenToUse: "when rewriting code but logic stays the same"
        ),
    Commit(
        name: "test",
        description: "adding or updating tests",
        example: ["test: check saveToUserDefaults"],
        emoji: "🧪",
        category: ["advanced", "testing"],
        whenToUse: "when adding or updating tests (NOT production code)"
        )
    ]

// MARK - 2️⃣.1 Метод выполняет команду над коммитами
 
func parseCommand(_ prompt: String) -> Command? { // Получает " LiSt " (что ввёл user)
    let cleaned = prompt.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) // " list " -> "list"
    return Command(rawValue: cleaned)
}

func startGame() {
    print("Game started")
    
    var score = 0
    var questions = Array(commits) // словарь -> массив кортежей
    questions.shuffle() // случайный порядок
    
    gameLoop: for commit in questions { // inner circle!
        print("\n? \(commit.whenToUse)") // задаем вопрос
        print("Your answer: ", terminator: "")
        let input = readLine()? // получаем ответ
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if input.lowercased() == "stop" {
            print("Game stopped")
            break gameLoop // <- выход из цикла с меткой!
        }
        
        if input.lowercased() == commit.name.lowercased() {
            print("✅ Correct!")
            score += 1
        } else {
            print("❌ Wrong. Correct answer: \(commit.name)")
        }
    }
    print("\n🏆 Your score: \(score) out of \(commits.count)")
    }

// Основная программа - пошаговое описание алгоритма
gameLoop: while true { // gameLoop +  break gameLoop -> метка для выхода из цикла
    print("\n📋 Commands: list, exit, game")
    let input = readLine() ?? ""
    
    guard let command = parseCommand(input) else {
        print("Unknown command")
        continue
    }

    switch command {
    case .game:
        startGame()
    case .list: // Программа выводит коммиты в команде .list.
        for commit in commits {
            print("\(commit.emoji) \(commit.name) - \(commit.description)")
        }
    case .exit:
        print("By, bro!")
        break gameLoop
    }
}
