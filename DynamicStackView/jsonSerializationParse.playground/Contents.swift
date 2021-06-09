
import UIKit

struct Customer {
    
    var firstName :String
    var lastName :String
    var age :Int
    
}

extension Customer {
    
    init?(dictionary :[String:Any]) {
        
        
        if let firstName = dictionary["firstName"] as? String {
             self.firstName = firstName
                 }
        else {
            self.firstName = "NA"
        }
        if let lastName = dictionary["lastName"] as? String {
             self.lastName = lastName
                 }
        else {
            self.lastName = "NA"
        }
        if let age = dictionary["age"] as? Int {
             self.age = age
                 }
        else {
            self.age = 0
        }
        
    }
    
}



let json = """

[
  {
     "firstName" : "John",
     "lastName" : "Doe",
     "age"  : 23
  },
  {
     "firstName" : "Mary",
     "lastName" : "Kate",
     "age"  : 35
  },
  {
     "firstName" : "Alex",
     "lastName" : "Lowe",
     
  }

]

""".data(using: .utf8)!

if let customerDictionaries = try! JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String:Any]] {
    
    let customers = customerDictionaries.compactMap(Customer.init)
    
    print(customers[0].firstName)
}
