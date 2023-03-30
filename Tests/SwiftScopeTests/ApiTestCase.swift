import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift

class ApiTestCase: XCTestCase {
    private let headers = ["Content-Type": "application/json"]
    
    func setupStub(responseFile: String, uri: String) {
        let path = OHPathForFileInBundle(responseFile, Bundle.module)
        
        _ = stub(condition: isPath(uri)) {
            _ in
            return fixture(filePath: path!, headers: self.headers)
        }
    }
}
