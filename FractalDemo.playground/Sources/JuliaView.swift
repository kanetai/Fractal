import UIKit

public class JuliaView: UIView {
    public var complexRect = ComplexRect(c1: Complex(-1.5, -1.5), c2: Complex(1.5, 1.5))
    public var divergenceCondition = { (z: Complex) -> Bool in return abs2(z) > 2 }
    public var mandelbrotSetColor: UIColor = UIColor.blackColor()
    public var polynomial = { (z: Complex) -> Complex in
        return z*z + Complex(-0.63, -0.407)
    }
    
    let block: Double // pick a value from 0.25 to 5.0 if block is 0.5
    let N: Int //number of iteration
    let rectScale: Double = 1
    let colorSet : [UIColor]
    
    //MARK: - life cycle
    required public init(frame: CGRect, colors: [UIColor] = [], iterationNumber: Int = 2000, blockiness: Double = 0.5) {
        block = abs(blockiness)
        N = abs(iterationNumber)
        var cSet: [UIColor] = colors
        while cSet.count <= N { cSet.append(UIColor.whiteColor()) }
        colorSet = cSet
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override func drawRect(rect : CGRect) {
        UIBezierPath(rect: rect).fill()
        Swift.print("\(self.complexRect)")
        let timer = Timer()
        self.drawJuliaSet(rect)
        timer.printElapsedTime()
    }
    
    //MARK: - calc Julia set
    func computeJuliaSetPoint(z0: Complex) -> UIColor {
        // z_{k+1} = (z_k)^2 + c
        // z_0 = 0
        var z = z0
        for k in 1...N {
            z = self.polynomial(z)
            guard !self.divergenceCondition(z) else {
                return self.colorSet[k] //z will diverge
            }
        }
        // c in Mandelbrot Set
        return self.mandelbrotSetColor
    }
    
    func drawJuliaSet(rect : CGRect) {
        let width = Double(rect.size.width), height = Double(rect.size.height)
        for x in 0.stride(through: width, by: self.block) {
            for y in 0.stride(through: height, by: self.block) {
                let z0 = self.complexRect.viewCoordToComplexCoord(x: x, y: y, rect: rect, rectScale: self.rectScale)
                self.computeJuliaSetPoint(z0).set()
                UIBezierPath(rect: CGRect(x: x, y: y, width: self.block, height: self.block)).fill()
            }
        }
    }
}