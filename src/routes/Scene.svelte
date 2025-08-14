<script context="module">
  export let start = performance.now();
</script>

<script lang="ts">
  import { T, useTask } from '@threlte/core'
  import { interactivity } from '@threlte/extras'
  import { Environment, OrbitControls } from '@threlte/extras'
  import { Tween } from 'svelte/motion'
    import { BackSide, PointLight, Vector2, Vector3 } from 'three';
  import fragmentShader from './background_fragment.glsl?raw'
  import vertexShader from './background_vertex.glsl?raw'
  import { onMount } from 'svelte';

  import { ShaderMaterial } from 'three';
  interactivity()
  const scale = new Tween(1);

  let start = performance.now();
  let time = 0.;
  onMount(() => {
    start = performance.now();
  });
  useTask((delta) => {
    time = (performance.now() - start) / 1000;
  })
</script>


<T.PerspectiveCamera
  makeDefault
  position={[5,5,5]}
  oncreate={(ref)=>{
    ref.lookAt(0,0,0)
  }}>
  <OrbitControls maxPolarAngle={1.56} />
</T.PerspectiveCamera>

<T.PointLight args={["blue",100,100,1]} position={[0,0,0]} 
/>


<T.Mesh 

scale={scale.current}
  onpointerenter={() => {
    scale.target = 1.1
  }}
  onpointerleave={() => {
    scale.target = 1
  }}
position.x = {2}
>
  <T.SphereGeometry args={[1, 20]}/>

  <T.MeshStandardMaterial color="red" />

</T.Mesh>

<T.Mesh>
  <T.SphereGeometry args={[100, 20]} side={BackSide}/>

  <T.MeshStandardMaterial 
  color="black" 
  side={BackSide}/>

</T.Mesh>

<T.Mesh>
  <T.SphereGeometry args={[100, 20]} side={BackSide}/>

  <T.ShaderMaterial 
  {fragmentShader}
  {vertexShader}
  transparent={true}
  side={BackSide}
  uniforms={{
    time: {
      value: 0  
    }
  }}
  uniforms.time.value={time}
  />

</T.Mesh>


