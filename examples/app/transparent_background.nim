import PIXI

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application with a transparent background
  await app.ApplicationInit(
    JsObject{
        backgroundAlpha: 0,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Load the bunny texture
  let texture = await AssetsLoad("https://pixijs.com/assets/bunny.png".js)

  # Create a new Sprite with the texture
  let bunny = Sprite(texture)

  # Center the sprite's anchor point
  bunny.anchor.set(0.5)

  # Move the sprite to the center of the screen
  bunny.x = app.screen.width / 2
  bunny.y = app.screen.height / 2

  app.stage.addChild(bunny)

  # Listen for animate update
  app.ticker.add(
    proc =
      # Just for fun, let's rotate our bunny over time!
      bunny.rotation += 0.1
  )
