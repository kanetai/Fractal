import Foundation

public struct Complex: Equatable, CustomStringConvertible {
    public var real: Double
    public var imaginary: Double
    
    public init(_ real: Double = 0.0, _ imaginary: Double = 0.0) {
        self.real = real
        self.imaginary = imaginary
    }
    public var description: String {
        get {
            let r = String(format: "%.2f", self.real)
            let i = String(format: "%.2f", abs(self.imaginary))
            var result = ""
            switch (self.real, self.imaginary) {
            case _ where self.imaginary == 0:
                result = "\(r)"
            case _ where self.real == 0:
                result = "\(i)𝒊"
            case _ where self.imaginary < 0:
                result = "\(r) - \(i)𝒊"
            default:
                result = "\(r) + \(i)𝒊"
            }
            return result
        }
    }
}
//MARK: - Operator of Complex Number
public func ==(lhs: Complex, rhs: Complex) -> Bool {
    return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
}
public func +(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real + rhs.real, lhs.imaginary + rhs.imaginary)
}
public func -(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real - rhs.real, lhs.imaginary - rhs.imaginary)
}
public prefix func -(c: Complex) -> Complex {
    return Complex(-(c.real), -(c.imaginary))
}
public func *(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real * rhs.real - lhs.imaginary * rhs.imaginary, lhs.real * rhs.imaginary + rhs.real * lhs.imaginary)
}
public func /(lhs: Complex, rhs: Complex) -> Complex {
    let denom = (rhs.real * rhs.real + rhs.imaginary * rhs.imaginary)
    return Complex((lhs.real * rhs.real + lhs.imaginary * rhs.imaginary)/denom, (lhs.imaginary * rhs.real - lhs.real * rhs.imaginary)/denom)
}
//MARK: -
public func +(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs + rhs.real, rhs.imaginary) }
public func +(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real + rhs, lhs.imaginary) }
public func -(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs - rhs.real, -rhs.imaginary) }
public func -(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real - rhs, lhs.imaginary) }
public func *(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs * rhs.real, lhs * rhs.imaginary) }
public func *(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real * rhs, lhs.imaginary * rhs) }
//MARK: -
public func abs2(c: Complex) -> Double {
    return c.real * c.real + c.imaginary * c.imaginary
}
public func abs(c: Complex) -> Double {
    return sqrt(abs2(c))
}
public func modulus(c: Complex) -> Double {
    return abs(c)
}
public func arg(c: Complex) -> Double {
    return atan2(c.imaginary, c.real)
}
//NARK: -
public func Re(c: Complex) -> Double { return c.real }
public func Im(c: Complex) -> Double { return c.imaginary }



