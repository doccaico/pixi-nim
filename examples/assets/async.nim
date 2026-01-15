import ../../src/pixi

proc init {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.ApplicationInit(
    JsObject{
        background: "#1099bb".js,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Load the bunny texture
  let texture = await AssetsLoad("https://pixijs.com/assets/bunny.png".js)

  # Create a new Sprite from the awaited loaded Texture
  let bunny = SpriteFrom(texture)

  # Center the sprite's anchor point
  bunny.anchor.set(0.5)

  # Move the sprite to the center of the screen
  bunny.x = app.screen.width / 2
  bunny.y = app.screen.height / 2

  app.stage.addChild(bunny)

discard init()
