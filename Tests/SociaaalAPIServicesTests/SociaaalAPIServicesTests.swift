import XCTest
@testable import SociaaalAPIServices

final class SociaaalAPIServicesTests: XCTestCase {

    let services = APIServices()

    func testNoThrowLoadCelebrity() {
        Task {
            do {
            let celebrities = try await services.loadCelebrities()
              XCTAssertFalse(celebrities.isEmpty)
            } catch {
              XCTFail("Celebrity loading failed: \(error)")
            }
        }
    }
}
