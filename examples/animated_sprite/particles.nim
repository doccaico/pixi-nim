import pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = jsNew Application()

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
  discard await Assets.load("https://pixijs.com/assets/spritesheet/mc.json")

  # Create an array to store the textures
  var explosionTextures: seq[JsObject]

  for i in 0..<26:
    let texture = Texture.from("Explosion_Sequence_A ".cstring & jsString(i + 1) & ".png".cstring)
    explosionTextures.add(texture)

  # Create and randomly place the animated explosion sprites on the stage
  for i in 0..<50:
    # Create an explosion AnimatedSprite
    let explosion = jsNew AnimatedSprite(explosionTextures)

    explosion.x = Math.random() * app.screen.width
    explosion.y = Math.random() * app.screen.height
    explosion.anchor.set(0.5)
    explosion.rotation = Math.random() * Math.PI
    explosion.scale.set(0.75 + Math.random() * 0.5)
    explosion.gotoAndPlay((Math.random() * 26) | 0)
    app.stage.addChild(explosion)

  # Start animating
  app.start()
