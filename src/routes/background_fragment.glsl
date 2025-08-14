varying vec2 vUv;
uniform float time;
varying vec3 vPosition;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) +
           (c - a)* u.y * (1.0 - u.x) +
           (d - b) * u.x * u.y;
}

const vec3 purple = vec3(201, 23, 199)/256.;
const vec3 black = vec3(0,0,0);
const float PI = 3.14159;

void main() {
    vec3 local_position = vPosition;
    
    
    vec3 color = mix(black,purple-vec3(noise(vPosition.xy/10.)/40.),cos(
      (vPosition.y+vPosition.x)/40.+noise(vPosition.xy/30.+vPosition.xz/30.+vPosition.yz/30.+vec2(time/5.)))
    );
    gl_FragColor = vec4(color, 1.0);
}
