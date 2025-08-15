<script lang="ts">
    import { watch } from '@threlte/core'
    import { T } from '@threlte/core';
    import { InstancedMesh, Instance } from '@threlte/extras';
    import Planet from './Planet.svelte'
    export let number_of_planets = 100
    export let spread = 100

    let values : [number, number, number, number][] = []

    // watch([number_of_planets, spread], () => {
    //     generateRandomValues()
    // })

    function generateRandomValues(){
        values = []
        for(let i = 0; i < number_of_planets; i++){
            values.push([
                spread*2*(Math.random()-0.5),
                spread*2*(Math.random()-0.5)/20,
                spread*2*(Math.random()-0.5),
                Math.random()
            ])
        }
    }

    generateRandomValues()
</script>


<!-- <InstancedMesh>
    <T.SphereGeometry args={[1,20]}/>
    <T.MeshStandardMaterial color="grey" />
    {#each values as value}
      {@const x = value[0]}
      {@const y = value[1]}
      {@const z = value[2]}
      {@const scale = value[3]}
      <Instance
        position={[x,y,z]}
        scale = {scale}
      />
    {/each}
  </InstancedMesh> -->

{#each values as value}
      {@const x = value[0]}
      {@const y = value[1]}
      {@const z = value[2]}
      {@const scale = value[3]}
      <Planet
        position={[x,y,z]}
        defaultScale = {scale}
      />
{/each}