<script>
  import { Canvas } from '@threlte/core'
  import Scene from './Scene.svelte'
</script>

<style>
  :global(html), :global(body) {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
  }

  #canvas-container {
    width: 100vw;
    height: 100vh;
    overflow: hidden;
  }
</style>

<div id="canvas-container">
<Canvas>
  <Scene />
</Canvas>
</div>
