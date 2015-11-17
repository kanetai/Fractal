import UIKit

/** f(n,c) = z^n + c */
private func f(n: Double, _ c: Complex = Complex()) -> (z: Complex) -> Complex {
    return {
        (z: Complex) -> Complex in
        return n == 2 ? z*z + c : pow(z, n) + c
    }
}
/** f(n,c) = z^n + x + iy */
private func f(n: Double, _ x: Double, _ y: Double = 0) -> (z: Complex) -> Complex {
    return f(n, Complex(x, y))
}

public func imageFromView(view: UIView) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0);
    defer { UIGraphicsEndImageContext() }
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    CGContextTranslateCTM(context, -view.frame.origin.x, -view.frame.origin.y)
    view.layer.renderInContext(context)
    let renderedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return renderedImage
    
}
extension JuliaView {
    public static func demo1(frame frame: CGRect, colors: [UIColor]) -> [UIView] {
        let goldenRatio = (1+sqrt(5))/2.0
        return demo(polynomials: [
            f(2, 0.285, 0.01),
            f(2, -0.70176, -0.3842),
            f(2, -0.8, 0.156),
            f(2, -0.755, 0.05),
            f(2, -0.63, -0.407),
            f(2, 1-goldenRatio, 0)
            ], frame: frame, colors: colors)
    }
    public static func demo2(frame frame: CGRect, colors: [UIColor]) -> [UIView] {
        return demo(polynomials: [
            f(2, 0.279), f(3, 0.4), f(5, 0.544), f(6, 0.590), f(7, 0.626)
            ], frame: frame, colors: colors)
    }
    private static func demo(polynomials polynomials: [(z: Complex) -> Complex], frame: CGRect, colors: [UIColor]) -> [UIView] {
        return polynomials.map { demo1Func -> UIView in
            let v = JuliaView(frame: frame, colors: colors, iterationNumber: colors.count)
            v.polynomial = demo1Func
            return v
        }
    }
}
