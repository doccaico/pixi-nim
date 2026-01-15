import ../../src/pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  app.ApplicationInit(
    JsObject{
        background: "#1099bb".js,
        resizeTo: window,
    }
  ).ApplicationThen(
    proc =
      # Append the application canvas to the document body
      document.body.appendChild(app.canvas)

      # Add the assets to load
      AssetsAdd(JsObject{
        alias: "flowerTop".js,
        src: "https://pixijs.com/assets/flowerTop.png".js,
      })
      AssetsAdd(JsObject{
        alias: "eggHead".js,
        src: "https://pixijs.com/assets/eggHead.png".js,
      })

      # Load the assets and get a resolved promise once both are loaded
      let texturesPromise = AssetsLoad(["flowerTop".js, "eggHead".js]) # => Promise<{flowerTop: Texture, eggHead: Texture}>

      # When the promise resolves, we have the texture!
      texturesPromise.TextureThen(
        proc (textures: JsObject) =
          # Create a new Sprite from the resolved loaded Textures
          let flower = SpriteFrom(textures.flowerTop)

          flower.anchor.set(0.5)
          flower.x = app.screen.width * 0.25
          flower.y = app.screen.height / 2
          app.stage.addChild(flower)

          let egg = SpriteFrom(textures.eggHead)

          egg.anchor.set(0.5)
          egg.x = app.screen.width * 0.75
          egg.y = app.screen.height / 2
          app.stage.addChild(egg)
      )
  )
