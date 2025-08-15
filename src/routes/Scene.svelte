<script context="module">
  export let start = performance.now();
</script>

<script lang="ts">
  import { T, useTask } from '@threlte/core'
  import { interactivity } from '@threlte/extras'
  import { OrbitControls } from '@threlte/extras'
  import { Tween } from 'svelte/motion'
    import { BackSide, PointLight, Vector2, Vector3 } from 'three';
  import fragmentShader from './background_fragment.glsl?raw'
  import vertexShader from './background_vertex.glsl?raw'
  import { onMount } from 'svelte';

  import Planet from './Planet.svelte';
  import Galaxy from './Galaxy.svelte';
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
  position={[50,50,50]}
  oncreate={(ref)=>{
    ref.lookAt(0,0,0)
  }}>
  <OrbitControls maxPolarAngle={1.56} autoRotate zoom0 = {1000}/>
</T.PerspectiveCamera>

<T.PointLight args={["white",100,100,1]} position={[0,0,0]} 
/>


<Planet position={[0,3,1]} color="green"/>
<!-- <Planet position={[0,0,0]} color="green"/> -->


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


<Galaxy/>