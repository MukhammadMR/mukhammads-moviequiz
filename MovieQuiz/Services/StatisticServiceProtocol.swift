//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//

import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(_ result: GameResult)
}

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ other: GameResult) -> Bool {
        return correct > other.correct
    }
}
