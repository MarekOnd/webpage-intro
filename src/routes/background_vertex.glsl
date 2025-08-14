// vertex.glsl
varying vec2 vUv;
varying vec3 vPosition;

void main() {
    vUv = uv;
    float rho = 1.;
    vPosition = vec3(
        rho*sin(uv.x)*cos(uv.y),
        rho*sin(uv.x)*sin(uv.y),
        rho*cos(uv.x)
    );
    vPosition = position;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
