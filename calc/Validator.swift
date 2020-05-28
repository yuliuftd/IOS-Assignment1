import Foundation

class Validator {
    
    // To check if it is a valid operator
    func checkOp(myOperator : String) {
        
    if myOperator != "+" && myOperator != "-" && myOperator != "x" && myOperator != "/" && myOperator != "%"
                {
                    print("invalid operator")
                    exit(3)
                }
        
    }
    
    //To check if number is an Integer
    func checkNum(number: Int) {
    if number > Int.max || number < Int.min {
        print("not an Integer")
        exit(4)
     }
    }
    
}

