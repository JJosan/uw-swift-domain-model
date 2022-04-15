import XCTest
@testable import DomainModel

class MoneyTests: XCTestCase {
  
  let tenUSD = Money(amount: 10, currency: "USD")
  let twelveUSD = Money(amount: 12, currency: "USD")
  let fiveGBP = Money(amount: 5, currency: "GBP")
  let fifteenEUR = Money(amount: 15, currency: "EUR")
  let fifteenCAN = Money(amount: 15, currency: "CAN")
  
  func testCanICreateMoney() {
    let oneUSD = Money(amount: 1, currency: "USD")
    XCTAssert(oneUSD.amount == 1)
    XCTAssert(oneUSD.currency == "USD")
    
    let tenGBP = Money(amount: 10, currency: "GBP")
    XCTAssert(tenGBP.amount == 10)
    XCTAssert(tenGBP.currency == "GBP")
  }
  
  func testUSDtoGBP() {
    let gbp = tenUSD.convert("GBP")
    XCTAssert(gbp.currency == "GBP")
    XCTAssert(gbp.amount == 5)
  }
  func testUSDtoEUR() {
    let eur = tenUSD.convert("EUR")
    XCTAssert(eur.currency == "EUR")
    XCTAssert(eur.amount == 15)
  }
  func testUSDtoCAN() {
    let can = twelveUSD.convert("CAN")
    XCTAssert(can.currency == "CAN")
    XCTAssert(can.amount == 15)
  }
  func testGBPtoUSD() {
    let usd = fiveGBP.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 10)
  }
  func testEURtoUSD() {
    let usd = fifteenEUR.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 10)
  }
  func testCANtoUSD() {
    let usd = fifteenCAN.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 12)
  }
  
  func testUSDtoEURtoUSD() {
    let eur = tenUSD.convert("EUR")
    let usd = eur.convert("USD")
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoGBPtoUSD() {
    let gbp = tenUSD.convert("GBP")
    let usd = gbp.convert("USD")
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoCANtoUSD() {
    let can = twelveUSD.convert("CAN")
    let usd = can.convert("USD")
    XCTAssert(twelveUSD.amount == usd.amount)
    XCTAssert(twelveUSD.currency == usd.currency)
  }
  
  func testAddUSDtoUSD() {
    let total = tenUSD.add(tenUSD)
    XCTAssert(total.amount == 20)
    XCTAssert(total.currency == "USD")
  }
  
  func testAddUSDtoGBP() {
    let total = tenUSD.add(fiveGBP)
    XCTAssert(total.amount == 10)
    XCTAssert(total.currency == "GBP")
  }

    // my tests
    func testSubtractUSDtoGBP() {
        let total = tenUSD.subtract(fiveGBP)
        XCTAssert(total.amount == 0)
        XCTAssert(total.currency == "GBP")
      }
        
      func testSubtractUSDtoUSD() {
        let total = tenUSD.subtract(tenUSD)
        XCTAssert(total.amount == 0)
        XCTAssert(total.currency == "USD")
      }
        
      func testSubtractEURtoUSD() {
        let total = fifteenEUR.subtract(tenUSD)
        XCTAssert(total.amount == 0)
        XCTAssert(total.currency == "USD")
      }
        
      func testGBPtoEUR() {
        let eur = fiveGBP.convert("EUR")
        XCTAssert(eur.currency == "EUR")
        XCTAssert(eur.amount == 15)
      }
        
      func testGBPtoCAN() {
        let can = fiveGBP.convert("CAN")
        XCTAssert(can.currency == "CAN")
        XCTAssert(can.amount == 12)
      }

      func testEURtoGBP() {
        let gbp = fifteenEUR.convert("GBP")
        XCTAssert(gbp.currency == "GBP")
        XCTAssert(gbp.amount == 5)
      }

      func testEURtoCAN() {
        let can = fifteenEUR.convert("CAN")
        XCTAssert(can.currency == "CAN")
        XCTAssert(can.amount == 12)
      }
        
      func testCANtoGBP() {
        let gbp = fifteenCAN.convert("GBP")
        XCTAssert(gbp.currency == "GBP")
        XCTAssert(gbp.amount == 6)
      }
      
      func testCANtoEUR() {
        let eur = fifteenCAN.convert("EUR")
        XCTAssert(eur.currency == "EUR")
        XCTAssert(eur.amount == 18)
      }

      func testGBPtoUSDtoGBP() {
          let usd = fiveGBP.convert("USD")
          let gbp = usd.convert("GBP")
          XCTAssert(fiveGBP.amount == gbp.amount)
          XCTAssert(fiveGBP.currency == gbp.currency)
      }
        
      func testGBPtoEURtoGBP() {
          let eur = fiveGBP.convert("EUR")
          let gbp = eur.convert("GBP")
          XCTAssert(fiveGBP.amount == gbp.amount)
          XCTAssert(fiveGBP.currency == gbp.currency)
      }
        
      func testEURtoUSDtoEUR() {
          let usd = fifteenEUR.convert("USD")
          let eur = usd.convert("EUR")
          XCTAssert(fifteenEUR.amount == eur.amount)
          XCTAssert(fifteenEUR.currency == eur.currency)
      }

      func testEURtoGBPtoEUR() {
          let gbp = fifteenEUR.convert("GBP")
          let eur = gbp.convert("EUR")
          XCTAssert(fifteenEUR.amount == eur.amount)
          XCTAssert(fifteenEUR.currency == eur.currency)
      }
        
      func testCANtoUSDtoCAN() {
          let usd = fifteenCAN.convert("USD")
          let can = usd.convert("CAN")
          XCTAssert(fifteenCAN.amount == can.amount)
          XCTAssert(fifteenCAN.currency == can.currency)
      }
        
      func testCANtoGBPtoCAN() {
          let gbp = fifteenCAN.convert("GBP")
          let can = gbp.convert("CAN")
          XCTAssert(fifteenCAN.amount == can.amount)
          XCTAssert(fifteenCAN.currency == can.currency)
      }

      func testCANtoEURtoCAN() {
          let eur = fifteenCAN.convert("EUR")
          let can = eur.convert("CAN")
          XCTAssert(fifteenCAN.amount == can.amount)
          XCTAssert(fifteenCAN.currency == can.currency)
      }
          

        static var allTests = [
            ("testCanICreateMoney", testCanICreateMoney),
            
            ("testSubtractUSDtoGBP", testSubtractUSDtoGBP),
            ("testSubtractUSDtoUSD", testUSDtoGBP),
            ("testSubtractEURtoUSD", testSubtractEURtoUSD),

            ("testUSDtoGBP", testUSDtoGBP),
            ("testUSDtoEUR", testUSDtoEUR),
            ("testUSDtoCAN", testUSDtoCAN),
            ("testGBPtoUSD", testGBPtoUSD),
            ("testEURtoUSD", testEURtoUSD),
            ("testCANtoUSD", testCANtoUSD),
            ("testUSDtoEURtoUSD", testUSDtoEURtoUSD),
            ("testUSDtoGBPtoUSD", testUSDtoGBPtoUSD),
            ("testUSDtoCANtoUSD", testUSDtoCANtoUSD),
            ("testAddUSDtoUSD", testAddUSDtoUSD),
            ("testAddUSDtoGBP", testAddUSDtoGBP),
            
            ("testGBPtoEUR", testGBPtoEUR),
            ("testGBPtoCAN", testGBPtoCAN),
            ("testEURtoGBP", testEURtoGBP),
            ("testEURtoCAN", testEURtoCAN),
            ("testCANtoGBP", testCANtoGBP),
            ("testCANtoEUR", testCANtoEUR),

            ("testGBPtoUSDtoGBP", testGBPtoUSDtoGBP),
            ("testGBPtoEURtoGBP", testGBPtoEURtoGBP),
            ("testEURtoUSDtoEUR", testEURtoUSDtoEUR),
            ("testEURtoGBPtoEUR", testEURtoGBPtoEUR),
            ("testCANtoUSDtoCAN", testCANtoUSDtoCAN),
            ("testCANtoGBPtoCAN", testCANtoGBPtoCAN),
            ("testCANtoEURtoCAN", testCANtoEURtoCAN)
            ]

}

