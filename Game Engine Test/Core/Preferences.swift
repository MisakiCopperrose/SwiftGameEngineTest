import MetalKit

public enum ClearColours {

    static let White = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    static let Grey = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)

    static let Black = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}

class Preferences {

    public static var ClearColor = ClearColours.Black

    public static var MainPixelFormat = MTLPixelFormat.bgra8Unorm
}
