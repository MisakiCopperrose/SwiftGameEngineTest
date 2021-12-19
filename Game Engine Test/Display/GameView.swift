import MetalKit

class GameView: MTKView {

    var renderer: Renderer!

    required init(coder: NSCoder) {
        super.init(coder: coder)
        // GPU used for the metal shader compilation
        device = MTLCreateSystemDefaultDevice()

        Engine.ignite(device: device!)
        // Color used to clear the screen
        clearColor = Preferences.ClearColor
        // No idea really
        colorPixelFormat = Preferences.MainPixelFormat

        renderer = Renderer()
        // Delegate all render functionality to the renderer
        delegate = renderer
    }

    // Mouse input

    // Keyboard input
}
