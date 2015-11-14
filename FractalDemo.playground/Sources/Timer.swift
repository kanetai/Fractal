import Foundation

public class Timer {
    var startTime: NSTimeInterval = 0
    public init() { self.start() }
    public func start() { self.startTime = NSDate().timeIntervalSince1970 }
    public var elapsedTime: NSTimeInterval { return NSDate().timeIntervalSince1970 - self.startTime }
    public func printElapsedTime() { Swift.print("Calculation time: \(self.elapsedTime)") }
}