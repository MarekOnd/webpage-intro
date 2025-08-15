<script>
    import { T, useTask } from '@threlte/core'
    import { Tween } from 'svelte/motion'
    import { FakeGlowMaterial } from '@threlte/extras';

    export let color = 'red'
    export let position = [0, 0, 0]
    export let hoverScale = 1
    export let defaultScale = 1

    export let radius = 1
    export let detail = 20

    const scale = new Tween(defaultScale);
</script>

<T.Mesh 

scale={scale.current}
  onpointerenter={() => {
    scale.target = hoverScale*defaultScale
  }}
  onpointerleave={() => {
    scale.target = defaultScale
  }}
position.x = {position[0]}
position.y = {position[1]}
position.z = {position[2]}
>
  <T.SphereGeometry args={[radius,detail]}/>
  <T.MeshStandardMaterial color={color} />

</T.Mesh>