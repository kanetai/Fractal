import Foundation

/**
 Rectangle containing specified two complex numbers on Gaussian plane.
*/
public struct ComplexRect: Equatable, CustomStringConvertible {
    private(set) var topLeft: Complex
    private(set) var bottomRight: Complex
    private(set) var bottomLeft: Complex
    private(set) var topRight: Complex
    public init(c1: Complex, c2: Complex) {
        let left = min(c1.real, c2.real), right = max(c1.real, c2.real)
        let top = max(c1.imaginary, c2.imaginary), bottom = min(c1.imaginary, c2.imaginary)
        topLeft = Complex(left, top)
        bottomRight = Complex(right, bottom)
        bottomLeft = Complex(left, bottom)
        topRight = Complex(right, top)
    }
    public init(point: Complex, zoom: Double) {
        let offset = Complex(1.0/zoom, 1.0/zoom)
        self.init(c1: point - offset, c2: point + offset)
    }
    
    public var description: String {
        return "tl:\(topLeft), br:\(bottomRight), bl:\(bottomLeft), tr:\(topRight)"
    }
    public func viewCoordToComplexCoord(x x: Double, y: Double, rect: CGRect, rectScale: Double = 1.0) -> Complex {
        let Co = self.topLeft, Cn = self.bottomRight - Co
        let W = Double(rect.size.width) * rectScale, H = Double(rect.size.height) * rectScale
        let cx = Re(Co) + x * Re(Cn)/W
        let cy = Im(Co) + y * Im(Cn)/H
        return Complex(cx, cy)
    }
    public func complexCoordToViewCoord(c: Complex, rect: CGRect, rectScale: Double = 1.0) -> CGPoint {
        let Co = self.topLeft, Cn = self.bottomRight - Co
        let W = Double(rect.size.width) * rectScale, H = Double(rect.size.height) * rectScale
        let x = W * (Re(c) - Re(Co)) / Re(Cn)
        let y = H * (Im(c) - Im(Co)) / Im(Cn)
        return CGPoint(x: x, y: y)
    }
}
public func ==(lhs: ComplexRect, rhs: ComplexRect) -> Bool {
    return (lhs.topLeft == rhs.topLeft) && (lhs.bottomRight == rhs.bottomRight)
}