import MetalKit

enum VertexShaderTypes {
    case basic
}

enum FragmentShaderTypes {
    case basic
}

class ShaderLibrary {

    public static var DefaultLibrary: MTLLibrary!

    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]

    public static func initialize() {

        DefaultLibrary = Engine.Device.makeDefaultLibrary()

        createDefaultShaders()
    }

    public static func createDefaultShaders() {

        vertexShaders.updateValue(BasicVertexShader(), forKey: .basic)
        fragmentShaders.updateValue(BasicFragmentShader(), forKey: .basic)
    }

    public static func vertex(_ vertexShaderType: VertexShaderTypes) -> MTLFunction {

        vertexShaders[vertexShaderType]!.function
    }

    public static func fragment(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction {

        fragmentShaders[fragmentShaderType]!.function
    }
}

protocol Shader {

    var name: String { get }

    var functionName: String { get }

    var function: MTLFunction { get }
}

public struct BasicVertexShader: Shader {

    public var name = "Basic Vertex Shader"
    public var functionName = "basic_vertex_shader"

    public var function: MTLFunction {

        let function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)

        function?.label = name

        return function!
    }
}

public struct BasicFragmentShader: Shader {

    public var name = "Basic Fragment Shader"
    public var functionName = "basic_fragment_shader"

    public var function: MTLFunction {

        let function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)

        function?.label = name

        return function!
    }
}
