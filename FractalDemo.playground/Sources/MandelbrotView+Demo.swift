import UIKit

extension MandelbrotView {
    public static func demo1(frame frame: CGRect, colors: [UIColor]) -> [UIView] {
        var views: [UIView] = []
        for i in 20...80 {
            let v = MandelbrotView(frame: frame, colors: colors, iterationNumber: colors.count)
            v.polynomial = { (z: Complex, c: Complex) -> Complex in
                return pow(z, Double(i)/10.0) + c
            }
            views.append(v)
        }
        return views
    }
}