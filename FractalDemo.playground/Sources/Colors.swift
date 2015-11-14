import Cocoa

public func buildColors(size : Int) -> [NSColor] {
    var colors: [NSColor] = []
    for c in 0..<size {
        let c_f = CGFloat(c)
        colors.append(NSColor(hue: CGFloat(abs(sin(c_f/30.0))), saturation: 1.0, brightness: c_f/100.0 + 0.8, alpha: 1.0))
    }
    return colors
}
