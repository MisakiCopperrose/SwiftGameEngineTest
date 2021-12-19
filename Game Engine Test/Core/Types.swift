import Foundation
import simd

protocol sizeable { }

extension sizeable {
    static var size: Int {
        MemoryLayout<Self>.size
    }

    static var stride: Int {
        MemoryLayout<Self>.stride
    }

    static func size(_ count: Int) -> Int {
        MemoryLayout<Self>.size * count
    }

    static func stride(_ count: Int) -> Int {
        MemoryLayout<Self>.stride * count
    }
}

struct Vertex: sizeable {
    var position: SIMD3<Float>
    var colour: SIMD4<Float>
}
