import PIXI

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.init(
    JsObject{
        autoStart: false,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Load the animation sprite sheet
  discard await AssetsLoad("https://pixijs.com/assets/spritesheet/mc.json".js)

  # Create an array to store the textures
  var explosionTextures: seq[JsObject]

  for i in 0..<26:
    let texture = TextureFrom("Explosion_Sequence_A ".js & js(i + 1) & ".png".js)
    explosionTextures.add(texture)

  # Create and randomly place the animated explosion sprites on the stage
  for i in 0..<50:
    # Create an explosion AnimatedSprite
    let explosion = AnimatedSprite(explosionTextures)

    explosion.x = MathRandom() * app.screen.width
    explosion.y = MathRandom() * app.screen.height
    explosion.anchor.set(0.5)
    explosion.rotation = MathRandom() * MathPI
    explosion.scale.set(0.75 + MathRandom() * 0.5)
    explosion.gotoAndPlay((MathRandom() * 26) | 0)
    app.stage.addChild(explosion)

  # Start animating
  app.start()
