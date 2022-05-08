//
//  InterviewTests.swift
//  InterviewTests
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import XCTest
@testable import Interview

class InterviewTests: XCTestCase {
    var menuPresenter: ListingViewModel?
    override func setUp() async throws {
        menuPresenter = ListingViewModel(serviceProvider: ServiceProvider<GetListService>())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func getMockInitialData() -> [DocsModel] {
        let docsModel1 = DocsModel(snippet: "testSnippest1", pub_date: "testDate", headline: nil, multimedia: [])
        let docsModel2 = DocsModel(snippet: "testSnippest2", pub_date: "testDate", headline: nil, multimedia: [])
        return [docsModel1, docsModel2]
    }
    func testGetItem() {
        menuPresenter?.initialDataResponse.value = getMockInitialData()
        XCTAssert(menuPresenter?.getItem(index: 0)?.snippet == "testSnippest1", "Mapping Failed")
    }
    func testGetItemWithNil() {
        menuPresenter?.initialDataResponse.value = nil
        XCTAssert(menuPresenter?.getItem(index: 0) == nil, "Mapping Failed")
    }
    
    func testSetSelectedItem() {
        menuPresenter?.setSelectedItem(DocsModel(snippet: "testSnippest", pub_date: "testDate", headline: nil, multimedia: []))
        XCTAssert(menuPresenter?.getSelectedItem()?.snippet == "testSnippest", "Mapping Failed")
    }
    
    func testGetSelectedItem() {
        menuPresenter?.selectedItem = DocsModel(snippet: "testSnippest", pub_date: "testDate", headline: nil, multimedia: [])
        XCTAssert(menuPresenter?.getSelectedItem()?.snippet == "testSnippest", "Mapping Failed")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
