import Cocoa

/** f(n,c) = z^n + c */
private func f(n: Double, _ c: Complex = Complex()) -> (z: Complex) -> Complex {
    return {
        (z: Complex) -> Complex in
        return n == 2 ? z*z + c : pow(z, n) + c
    }
}
/** f(n,c) = z^n + c */
private func f(n: Double, _ c: Double) -> (z: Complex) -> Complex {
    return f(n, Complex(c, 0))
}
let demo2Funcs: [(z: Complex) -> Complex] = [
    f(2, 0.279), f(3, 0.4), f(5, 0.544), f(6, 0.590), f(7, 0.626)
]
private var demo2Itr = 0;

extension JuliaView {
    
    public class func demo1(frame frame: NSRect, colors: [NSColor], iterationNumber: Int = 2000) -> [NSView] {
        let goldenRatio = (1+sqrt(5))/2.0
        let cs: [Complex] = [
            Complex(0.285, 0.01),
            Complex(-0.70176, -0.3842),
            Complex(-0.8, 0.156),
            Complex(-0.755, 0.05),
            Complex(-0.63, -0.407),
            Complex(1-goldenRatio, 0)
        ]
        return cs.map { c -> NSView in
            let v = JuliaView(frame: frame, colors: colors, iterationNumber: iterationNumber)
            v.polynomial = f(2, c)
            return v
        }
    }
    public func demo2() {
        self.polynomial = demo2Funcs[demo2Itr%demo2Funcs.count]
        demo2Itr++
    }
}
