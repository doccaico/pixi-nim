import ../../src/pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
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

  # Start loading right away and create a promise
  let texturePromise = AssetsLoad("https://pixijs.com/assets/bunny.png".js)

  # When the promise resolves, we have the texture!
  texturePromise.TextureThen(
    proc (resolvedTexture: JsObject) =
      # create a new Sprite from the resolved loaded Texture
      let bunny = SpriteFrom(resolvedTexture)

      # center the sprite's anchor point
      bunny.anchor.set(0.5)

      # move the sprite to the center of the screen
      bunny.x = app.screen.width / 2
      bunny.y = app.screen.height / 2

      app.stage.addChild(bunny)
  )
