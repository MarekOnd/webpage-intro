<script>
  import { T } from '@threlte/core'
  import { interactivity } from '@threlte/extras'
  import { OrbitControls } from '@threlte/extras'
  import { Tween } from 'svelte/motion'
    import { PointLight, Vector2, Vector3 } from 'three';
  
  interactivity()
  const scale = new Tween(1);
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
