//: Playground - noun: a place where people can play
import XCPlayground
import UIKit
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
let N = 1000
let colors: [UIColor] = buildColors(N)



/*: 
###Julia Set <https://en.wikipedia.org/wiki/Julia_set>
Z_{k+1} = (Z_k)^2 + c
{Z_0 ∈ ℂ | ¬(|Z_{k+1}| -> ∞, (k -> ∞))}
*/
let jv = JuliaView(frame: rect, colors: colors, iterationNumber: N, blockiness: 0.5)
let views = JuliaView.demo1(frame: rect, colors: colors)
let imgs = JuliaView.demo2(frame: rect, colors: colors).flatMap { v -> UIImage? in
    return imageFromView(v)
}
let iv = UIImageView(frame: rect)
XCPlaygroundPage.currentPage.liveView = iv
iv.animationImages = imgs
iv.animationDuration = 1.0
iv.animationRepeatCount = 0
iv.startAnimating()


