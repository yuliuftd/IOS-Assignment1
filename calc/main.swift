import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()       //remove ./calc

let calculator = Calculator();
let result = calculator.calculate(args: args)
print(result)


