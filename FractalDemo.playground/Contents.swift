//: Playground - noun: a place where people can play

import Cocoa

let goldenRatio = (1+sqrt(5))/2.0

let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
let N = 2000
let colors: [NSColor] = buildColors(N)



/*: 
###Julia Set <https://en.wikipedia.org/wiki/Julia_set>
Z_{k+1} = (Z_k)^2 + Const
{Z_0 ∈ ℂ | ¬(|Z_{k+1}| -> ∞, (k -> ∞))}
*/
let jv = JuliaView(frame: rect, colors: colors, iterationNumber: N)
jv.complexRect = ComplexRect(point: Complex(0,0), zoom: 0.7)
jv.Const = Complex(0.285, 0.01)
jv.Const = Complex(-0.70176, -0.3842)
jv.Const = Complex(-0.8, 0.156)
jv.Const = Complex(-0.755, 0.05)
jv.Const = Complex(-0.63, -0.407)
jv.Const = Complex(1-goldenRatio, 0)

