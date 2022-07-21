//
//  APIFetcherTests.swift
//  PingaAppTests
//
//  Created by Arthur Martins Saraiva on 20/07/22.
//

import XCTest
@testable import PingaApp

class APIFetcherTests: XCTestCase {
    var sut: APIFetcher?
    
    override func setUpWithError() throws {
        sut = APIFetcher()
        super.setUp()
        
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
        
    }
    
    func testDeveTestarOsCaminhosDaUrl() {
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")
        XCTAssertEqual(url, url?.absoluteURL)
        XCTAssertEqual( "www.thecocktaildb.com", url?.host)
        XCTAssertEqual( "/api/json/v1/1/random.php", url?.path)
        XCTAssertNil(url?.baseURL)
    }
    
    func testPegaUmaBebidaAleatoria() {
        sut?.fetchRandomDrink(completion: { fetchedData in
            XCTAssertNotNil(fetchedData)
        })
    }
    
    func testPegarUmaBebidaEspecifica() {
        sut?.fetchDrink(idDrink: "17266", completion: { fetchedData in
            XCTAssertNotNil(fetchedData)
            XCTAssertEqual("Oatmeal Cookie", fetchedData?.drinks.first?.strDrink)
            XCTAssertEqual("Cocktail", fetchedData?.drinks.first?.strCategory)
        })
    }
}
