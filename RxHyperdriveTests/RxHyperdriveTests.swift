//
//  RxHyperdriveTests.swift
//  RxHyperdriveTests
//
//  Created by Kyle Fuller on 13/09/2015.
//  Copyright © 2015 Cocode. All rights reserved.
//

import XCTest
import Hyperdrive
@testable import RxHyperdrive

class RxHyperdriveTests: XCTestCase {
  func testReadme() {
    let expectation = expectationWithDescription("Request")

    let hyperdrive = Hyperdrive()

    hyperdrive.enter("https://polls.apiblueprint.org/")
      .flatMap { representor in
        hyperdrive.request(representor.transitions["questions"])
      }
      .subscribeNext { representor in
        print(representor.representors["questions"])
        expectation.fulfill()
      }

    waitForExpectationsWithTimeout(5.0, handler: nil)
  }
}
