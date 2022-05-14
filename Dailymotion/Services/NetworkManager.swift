//
//  NetworkManager.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

class NetworkManager {
    
    enum ManagerErrors: Error {
        case invalidResponse
        case invalidStatusCode(Int)
    }
    
    enum HttpMethod: String {
        case get
        
        var method: String { rawValue.uppercased() }
    }
    
    func request<T: Decodable>(fromURL url: URL, httpsMethod: HttpMethod = .get, completion: @escaping(Result<T, Error>) -> Void) {
        
        let completionOnMain: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpsMethod.method
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completionOnMain(.failure(error))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(ManagerErrors.invalidResponse)) }
            
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
            }
            
            guard let data = data else { return }
            
            do {
                let encodedData = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(encodedData))
                
            } catch {
                debugPrint(error.localizedDescription)
                completionOnMain(.failure(error))
            }
        }
        
        urlSession.resume()
    }
}
