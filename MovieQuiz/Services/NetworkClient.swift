//
//  NetworkClient.swift
//  MovieQuiz
//
//  Created by Мухаммад Махмудов on 22.04.2025.
//

import Foundation

struct NetworkClient {
    private enum NetworkError: Error {
        case codeError(Int)
        case noData
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               !(200...299).contains(response.statusCode) {
                handler(.failure(NetworkError.codeError(response.statusCode)))
                return
            }
            
            guard let data = data else {
                handler(.failure(NetworkError.noData))
                return
            }
            handler(.success(data))
            
        }
        
        task.resume()
    }
}
