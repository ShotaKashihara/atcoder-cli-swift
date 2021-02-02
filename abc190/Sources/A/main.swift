// A - Very Very Primitive Game
// https://atcoder.jp/contests/abc190/tasks/abc190_a
import Foundation

let line = readLine()!.components(separatedBy: " ")
let (a, b, c) = (Int(line[0])!, Int(line[1])!, Int(line[2])!)

print(a+c > b ? "Takahashi" : "Aoki")
