import Foundation
import UIKit

protocol APIServicesType {
    func loadImage(url: String) async throws -> UIImage
    func loadCelebrities() async throws -> [Celebrity]
}

class APIServices: APIServicesType {

    enum APIError: Error {
        case failedToConvertData
    }

    func loadImage(url: String) async throws -> UIImage {

        let url = URL(string: url)!
        do {
            let data = try Data(contentsOf: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw APIError.failedToConvertData
            }
        } catch {
            throw error
        }
    }

    func loadCelebrities() async throws -> [Celebrity] {
        let (data, _) = try await URLSession.shared.data(from:URL(string: "https://firebasestorage.googleapis.com/v0/b/avastar-dev.appspot.com/o/celebrities-search.json?alt=media&token=fa6e7467-bf64-45fd-aa98-0f3cc027584d")!)
        return try JSONDecoder().decode([Celebrity].self, from: data)
    }
}
