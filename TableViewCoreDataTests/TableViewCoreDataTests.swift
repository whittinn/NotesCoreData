//
//  TableViewCoreDataTests.swift
//  TableViewCoreDataTests
//
//  Created by Nathaniel Whittington on 12/8/21.
//

import XCTest
@testable import TableViewCoreData

class TableViewCoreDataTests: XCTestCase {

   
    func test_tableViewController_shouldBeConnected(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tv : ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        tv.loadViewIfNeeded()
        
    }
    
    
    func test_navigation_shouldBeConnecte(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc.titleLabel)
    }
    
    
    func test_viewControllerDelegates_shouldBeConnected(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc.tableView.delegate, "delegate")
        XCTAssertNotNil(vc.tableView.dataSource, "dataSource")
        
    }

}
