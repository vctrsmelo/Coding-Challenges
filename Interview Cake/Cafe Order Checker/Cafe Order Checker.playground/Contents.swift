import XCTest

/*
 I have two registers: one for take-out orders, and the other for the other folks eating inside the cafe. All the customer orders get combined into one list for the kitchen, where they should be handled first-come, first-served.

 Recently, some customers have been complaining that people who placed orders after them are getting their food first. Yikes—that's not good for business!

 To investigate their claims, one afternoon I sat behind the registers with my laptop and recorded:

 The take-out orders as they were entered into the system and given to the kitchen. (takeOutOrders)
 The dine-in orders as they were entered into the system and given to the kitchen. (dineInOrders)
 Each customer order (from either register) as it was finished by the kitchen. (servedOrders)

 Given all three arrays, write a function to check that my service is first-come, first-served. All food should come out in the same order customers requested it.
 
 Note: Order numbers are arbitrary. They do not have to be in increasing order.
 
Example: given the arrays below, your algorithm must return True
 - Take Out Orders: [17, 8, 24]
 - Dine In Orders: [12, 19, 2]
 - Served Orders: [17, 8, 12, 19, 24, 2]
 
Example: given the arrays below, your algorithm must return False
 - Take Out Orders: [1, 3, 5]
 - Dine In Orders: [2, 4, 6]
 - Served Orders: [1, 2, 4, 6, 5, 3]
 
 */

func orderChecker(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
    guard takeOutOrders.isEmpty == false else { return dineInOrders == servedOrders }
    guard dineInOrders.isEmpty == false else { return takeOutOrders == servedOrders }
    guard servedOrders.isEmpty == false else { return false }
    
    var nextTakeOut = 0, nextDineIn = 0
    for served in servedOrders {
        if nextTakeOut < takeOutOrders.count && served == takeOutOrders[nextTakeOut]{
            nextTakeOut += 1
            continue
        } else if nextDineIn < dineInOrders.count && served == dineInOrders[nextDineIn] {
            nextDineIn += 1
            continue
        }
        
        return false
    }
    
    return nextTakeOut == takeOutOrders.count && nextDineIn == dineInOrders.count
}

final class TestCase: XCTestCase {
    
    func test() {
        XCTAssertTrue(orderChecker(takeOutOrders: [], dineInOrders: [], servedOrders: []))
        XCTAssertTrue(orderChecker(takeOutOrders: [1], dineInOrders: [], servedOrders: [1]))
        XCTAssertTrue(orderChecker(takeOutOrders: [], dineInOrders: [173], servedOrders: [173]))
        XCTAssertTrue(orderChecker(takeOutOrders: [], dineInOrders: [173], servedOrders: [173]))
        XCTAssertTrue(orderChecker(takeOutOrders: [1,3,5,7,9], dineInOrders: [2,4,6,8,10], servedOrders: [1,3,2,4,6,5,8,7,10,9]))
        
        XCTAssertFalse(orderChecker(takeOutOrders: [], dineInOrders: [5], servedOrders: []))
        XCTAssertFalse(orderChecker(takeOutOrders: [7], dineInOrders: [], servedOrders: []))
    }
}

TestCase.defaultTestSuite.run()
