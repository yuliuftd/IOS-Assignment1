import Foundation

let validator = Validator()

class Calculator {
    
    var result = 0
    
    //Define five operators
    func add(_ no1: Int, _ no2: Int) -> Int {
        return no1 + no2
    }
    func minus(_ no1: Int, _ no2: Int) -> Int {
        return no1 - no2
    }
    func multiply(_ no1: Int, _ no2: Int) -> Int {
        return no1 * no2
    }
    func divide(_ no1: Int, _ no2: Int) -> Int {
        if no2 == 0 {
            print("no2 cannot be zero")
            exit(1)
        }
        return no1 / no2
    }
    func module(_ no1: Int, _ no2: Int) -> Int {
        if no2 == 0 {
            print("no2 cannot be zero")
            exit(2)
        }
        return no1 % no2
    }
    
    //Define calculate precedence, check input , do x / % first, than + and -
    func calculate(args: [String]) -> String {
        
        var n = 0
        var m = 1
        var myOperator:String
        var array1 = args
        var result:Int
        var n1:Int
        var n2:Int
        var checknumber:Int
        
        // check input
        for i in stride(from: 1, to: array1.count, by:2 ) {
            myOperator = array1[i]
            validator.checkOp(myOperator: myOperator)
        }
        
        for i in stride(from: 0, to: array1.count, by: 2) {
            checknumber = Int(array1[i])!
            validator.checkNum(number: checknumber)
        }
        
        if array1.count == 2 {
            print("Incomplete calculation")
            exit(5)
        }
        
        let index = array1.count
        n = index / 2
        
         //convert args[odd] to Integer
        //swich operator than calculate use function
        for _ in stride(from: 0, to: n, by: 1 ) {
            
            n1 = Int(array1[m-1])!
            myOperator = array1[m]
            n2 = Int(array1[m+1])!
            
            switch myOperator {
            case "x":
            result = multiply(n1, n2)
            array1[m-1] = String(result)
            array1.remove(at: m)
            array1.remove(at: m)
            break
            case "/":
            result = divide(n1, n2)
            array1[m-1] = String(result)
            array1.remove(at: m)
            array1.remove(at: m)
            break
            case "%":
            result = module(n1, n2)
            array1[m-1] = String(result)
            array1.remove(at: m)
            array1.remove(at: m)
            break
            case "+":
            m = m + 2
            break
            case "-":
            m = m + 2
            break
            default:
                print(" false")
            }
           // print("-",array1,"-")
        }
        //print("-",array1.count,"-")
        
        while array1.count>2 {
            
            n1 = Int(array1[0])!
            myOperator = array1[1]
            n2 = Int(array1[2])!
            switch myOperator {
            case "+":
            result = add(n1, n2)
            array1[0] = String(result)
            array1.remove(at: 1)
            array1.remove(at: 1)
            break
            case "-":
            result = minus(n1, n2)
            array1[0] = String(result)
            array1.remove(at: 1)
            array1.remove(at: 1)
            break
            default:
                print("add failed")
            }
            //print("-",array1[0], "-")
        }
        
        //Transfer postive integer to it's absolute, keep negative integer
        
        var check1:Int = Int(array1[0])!
        
        if check1 > 0 {
            check1 = abs(check1)
            array1[0] = String(check1)
        }else{
            array1[0] = String(check1)
        }
        let Result = array1[0]
        return (Result)
    }
}

