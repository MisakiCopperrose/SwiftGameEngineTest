import MetalKit

enum RenderPipelineStateTypes {
    case basic
}

class RenderPipelineStateLibrary {

    private static var renderPipelineStates: [RenderPipelineStateTypes: RenderPipelineState] = [:]

    public static func initialize() {

        createDefaultRenderPipelineStates()
    }

    private static func createDefaultRenderPipelineStates() {

        renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .basic)
    }

    public static func pipeLineState(_ renderPipelineStateType: RenderPipelineStateTypes) ->
    MTLRenderPipelineState {

        (renderPipelineStates[renderPipelineStateType]?.renderPipelineState)!
    }
}

protocol RenderPipelineState {

    var name: String { get }

    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct BasicRenderPipelineState: RenderPipelineState {

    var name = "Basic Render Pipeline State"

    var renderPipelineState: MTLRenderPipelineState {

        var renderPipelineState: MTLRenderPipelineState!

        do {
            renderPipelineState = try
            Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.basic))
        } catch let error as NSError {
            print(error)
        }

        return renderPipelineState
    }
}
