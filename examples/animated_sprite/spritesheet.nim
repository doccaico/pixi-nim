import pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = jsNew Application()

  # Initialize the application
  await app.init(
    JsObject{
        background: "#1099bb".cstring,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Load the animation sprite sheet
  discard await Assets.load("https://pixijs.com/assets/spritesheet/fighter.json")

  # Create an array of textures from the sprite sheet
  var frames: seq[JsObject]

  for i in 0..<30:
    let val = if i < 10: "0".cstring & jsString(i) else: jsString(i)
    # Magically works since the spritesheet was loaded with the pixi loader
    frames.add(Texture.from("rollSequence00".cstring & val & ".png".cstring))

  # Create an AnimatedSprite (brings back memories from the days of Flash, right ?)
  let anim = jsNew AnimatedSprite(frames)

  #[
   * An AnimatedSprite inherits all the properties of a PIXI sprite
   * so you can change its position, its anchor, mask it, etc
  ]#
  anim.x = app.screen.width / 2
  anim.y = app.screen.height / 2
  anim.anchor.set(0.5)
  anim.animationSpeed = 0.5
  anim.play()

  app.stage.addChild(anim);

  # Animate the rotation
  app.ticker.add(
    proc = anim.rotation += 0.01
  )
