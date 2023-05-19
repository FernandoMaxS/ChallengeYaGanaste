//
//  ChallengeYaGanasteTests.swift
//  ChallengeYaGanasteTests
//
//  Created by Fernando Maximiliano on 19/05/23.
//

import XCTest
@testable import ChallengeYaGanaste

final class ChallengeYaGanasteTests: XCTestCase {
    var sut: ViewController!

       override func setUp() {

           super.setUp()

           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           self.sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
           
           self.sut.loadViewIfNeeded()
           self.sut.viewDidLoad()
       }

       override func tearDown() {
       
           super.tearDown()
       }
    func test_createViewController() {
          
          
         // sut.loadViewIfNeeded()
          
        XCTAssertEqual(sut.navigationItem.title, "Banks")
          XCTAssertEqual(sut.view.backgroundColor, .white)
      }
    
    func test_tableView_numberOfRows() {
          
           //sut.loadViewIfNeeded()
           
           let tableView = sut.tableView
        XCTAssertEqual(10, tableView?.numberOfRows(inSection: .zero))
       }


}
