import Darwin
struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    var amount : Int
    var currency : String
    init (amount : Int, currency : String) {
        switch currency {
        case "USD":
            self.amount = amount
            self.currency = "USD"
        case "GBP":
            self.amount = amount
            self.currency = "GBP"
        case "EUR":
            self.amount = amount
            self.currency = "EUR"
        case "CAN", "funny money":
            self.amount = amount
            self.currency = "CAN"
        default:
            self.amount = 0
            self.currency = "no"
        }
    }
    
    func convert(_ currencyName : String) -> Money {
        // turn the current currency type into USD
        var temp = toUSD(Double(self.amount), self.currency)
        
        // turn the USD'd money into the type we want
        switch currencyName {
        case "GBP":
            temp *= 0.5
        case "EUR":
            temp *= 1.5
        case "CAN", "funny money":
            temp *= 1.25
        default:
            temp *= 1
        }
        return Money(amount : Int(temp), currency : currencyName)
    }

    func add(_ otherMoney : Money) -> Money {
        let temp1 = otherMoney.currency
        let temp2 = self.convert(temp1)
        return Money(amount: otherMoney.amount + temp2.amount, currency: temp1)
    }
    
    func subtract(_ otherMoney : Money) -> Money {
        let temp1 = otherMoney.currency
        let temp2 = self.convert(temp1)
        return Money(amount: otherMoney.amount - temp2.amount, currency: temp1)
    }
    
    private func toUSD(_ a : Double, _ c : String) -> Double {
        switch c {
        case "GBP":
            return a * 2
        case "EUR":
            return a * (2/3)
        case "CAN", "funny money":
            return a * (4/5)
        default:
            return a
        }
    }
}



////////////////////////////////////
// Job
//
public class Job {
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    var title : String
    var type : JobType

    init (title : String, type: JobType) {
        self.title = title
        self.type = type
    }
    
    func calculateIncome(_ w : Int) -> Int {
        switch type {
        case .Hourly(let wage):
            return Int(wage) * Int(w)
        case .Salary(let sal):
            return Int(sal)
        }
    }
    
    func raise(byAmount : Int) {
        switch type {
        case .Hourly(let wage):
            self.type = Job.JobType.Hourly(wage + Double(byAmount))
        case .Salary(let sal):
            self.type = Job.JobType.Salary(sal + UInt(byAmount))
        }
    }
    
    func raise(byAmount : Double) {
        switch type {
        case .Hourly(let wage):
            self.type = Job.JobType.Hourly(wage + Double(byAmount))
        case .Salary(let sal):
            self.type = Job.JobType.Salary(sal + UInt(byAmount))
        }
    }
    
    func raise(byPercent : Double) {
        switch type {
        case .Hourly(let wage):
            self.type = Job.JobType.Hourly((wage * byPercent) + wage)
        case .Salary(let sal):
            self.type = Job.JobType.Salary(UInt(Double(sal) * byPercent) + sal)
        }
    }
}

////////////////////////////////////
// Person
//
public class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var job : Job? {
        didSet {
            if age < 18 {
                job = nil
            }
        }
    }
    var spouse : Person? {
        didSet {
            if age < 18 {
                spouse = nil
            }
        }
    }
    
    init (firstName : String, lastName : String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func toString() -> String {
        return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
    }
    
}

////////////////////////////////////
// Family
//
public class Family {
    var members : [Person] = []
    
    init(spouse1 : Person, spouse2 : Person) {
        if spouse1.age >= 18 && spouse2.age >= 18 {
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    
    func haveChild(_ person : Person) {
        members.append(person)
    }
    
    func householdIncome() -> Int {
        var total = 0
        for i in 0..<members.count {
            let current = members[i]
            if current.job != nil {
                total += current.job!.calculateIncome(2200)
            }
        }
        return total
    }
    
}
