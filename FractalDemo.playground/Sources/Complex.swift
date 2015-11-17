import Foundation

public struct Complex: Equatable, CustomStringConvertible {
    public var real: Double
    public var imag: Double
    public var conjugate: Complex { return Complex(self.real, -self.imag) }
    public var isReal: Bool { return (self.imag == 0 || self.imag == -0) }
    
    public init(_ real: Double = 0.0, _ imag: Double = 0.0) {
        self.real = real
        self.imag = imag
    }
    public static func polar(r r: Double, theta: Double) -> Complex {
        return abs(r) * exp(Complex(0, theta))
    }
    public var description: String {
        get {
            let r = String(format: "%.2f", self.real)
            let i = String(format: "%.2f", abs(self.imag))
            var result = ""
            switch (self.real, self.imag) {
            case _ where self.imag == 0:
                result = "\(r)"
            case _ where self.real == 0:
                result = "\(i)𝒊"
            case _ where self.imag < 0:
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
    return lhs.real == rhs.real && lhs.imag == rhs.imag
}
public func +(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real + rhs.real, lhs.imag + rhs.imag)
}
public func -(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real - rhs.real, lhs.imag - rhs.imag)
}
public prefix func -(z: Complex) -> Complex {
    return Complex(-(z.real), -(z.imag))
}
public func *(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(lhs.real * rhs.real - lhs.imag * rhs.imag, lhs.real * rhs.imag + rhs.real * lhs.imag)
}
public func /(lhs: Complex, rhs: Complex) -> Complex {
    let denom = abs2(rhs)
    return Complex((lhs.real * rhs.real + lhs.imag * rhs.imag)/denom, (lhs.imag * rhs.real - lhs.real * rhs.imag)/denom)
}
//MARK: -
public func +(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs + rhs.real, rhs.imag) }
public func +(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real + rhs, lhs.imag) }
public func -(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs - rhs.real, -rhs.imag) }
public func -(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real - rhs, lhs.imag) }
public func *(lhs: Double, rhs: Complex) -> Complex { return Complex(lhs * rhs.real, lhs * rhs.imag) }
public func *(lhs: Complex, rhs: Double) -> Complex { return Complex(lhs.real * rhs, lhs.imag * rhs) }
//MARK: -
public func abs2(z: Complex) -> Double {
    return z.real * z.real + z.imag * z.imag
}
public func abs(z: Complex) -> Double {
    return sqrt(abs2(z))
}
public func modulus(z: Complex) -> Double {
    return abs(z)
}
public func arg(z: Complex) -> Double {
    return atan2(z.imag, z.real)
}
//NARK: -
public func Re(z: Complex) -> Double { return z.real }
public func Im(z: Complex) -> Double { return z.imag }
//MARK: - exponetial function
public func exp(z: Complex) -> Complex {
    return exp(z.real) * Complex(cos(z.imag), sin(z.imag))
}
public func pow(z: Complex, _ p: Double) -> Complex {
    return Complex.polar(r: pow(abs(z), p), theta: arg(z)*p)
}
public func sqrt(z: Complex) -> Complex {
    return sqrt(abs(z)) * exp(Complex(0, arg(z)/2))
    /*if z.isReal {
        return z.real < 0 ? Complex(0, sqrt(-z.real)) : Complex(sqrt(z.real), 0)
    } else {
        if z.imag < 0 { return sqrt(z.conjugate).conjugate }
        else {
            let r = abs(z), x = z.real
            return Complex(sqrt((r + x) / 2.0), sqrt((r - x) / 2.0))
        }
    }*/
}
//MARK: - trigonometric function
public func sin(z: Complex) -> Complex {
    return Complex(sin(z.real)*cosh(z.imag), cos(z.real)*sinh(z.imag))
}
public func cos(z: Complex) -> Complex {
    return Complex(cos(z.real)*cosh(z.imag), -sin(z.real)*sinh(z.imag))
}
public func tan(z: Complex) -> Complex {
    return sin(z)/cos(z)
}
//MARK: - hyperbolic function
public func sinh(z: Complex) -> Complex {
    return Complex(sinh(z.real)*cos(z.imag), cosh(z.real)*sin(z.imag))
}
public func cosh(z: Complex) -> Complex {
    return Complex(cosh(z.real)*cos(z.imag), sinh(z.real)*sin(z.imag))
}
public func tanh(z: Complex) -> Complex {
    return sinh(z)/cosh(z)
}