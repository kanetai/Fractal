//: Playground - noun: a place where people can play
import XCPlayground
import Cocoa

let goldenRatio = (1+sqrt(5))/2.0

let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
let N = 1000
let colors: [NSColor] = buildColors(N)



/*: 
###Julia Set <https://en.wikipedia.org/wiki/Julia_set>
Z_{k+1} = (Z_k)^2 + c
{Z_0 ∈ ℂ | ¬(|Z_{k+1}| -> ∞, (k -> ∞))}
*/
let jv = JuliaView(frame: rect, colors: colors, iterationNumber: N, blockiness: 0.5)

for i in 1...15 {
    jv.demo2()
}

/*let a = JuliaView.demo1(frame: rect, colors: colors, iterationNumber: N)
let b = JuliaView.demo2(frame: rect, colors: colors, iterationNumber: N)*/
