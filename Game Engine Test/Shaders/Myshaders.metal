#include <metal_stdlib>

using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 colour [[ attribute(1) ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 colour;
};

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]]) {
    RasterizerData data;
    
    data.position = float4(vIn.position, 1);
    data.colour = vIn.colour;
    
    return data;
}

fragment half4 basic_fragment_shader(RasterizerData data [[ stage_in ]]) {
    float4 colour = data.colour;
    
    return half4(colour.r, colour.g, colour.b, colour.a);
}

